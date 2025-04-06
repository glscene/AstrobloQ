unit uaHiputils;

interface

uses
  System.Math,
  Vcl.Controls,
  Vcl.Graphics,

  GLS.Canvas,
  GLS.WindowsFont,
  GLS.RenderContextInfo,
  GLS.Color,

  uaHygmain;

// Реализация функции вычисления десятичного логарифма
function logd(x: double): double;

// Листинг D.3. Вычисление распределения звезд по абсолютной звездной величине
procedure AbsMagDistrib;

// Листинг D.4. Вычисление средней абсолютной звездной величины звезд,
// список которых находится в файле lumin.txt
procedure Aver;

// Листинг D.5. Исходный текст функций InitCriteria, InCelestia, ClearCriteria
(* Инициализация критерия с использованием выходного файла программы
  Celestia 2000. name - имя файла. Возвращает число звезд в списке *)
function InitCriteria(name: string): longint;
// Функция проверяет, есть ли звезда в списке
function InCelestia(n: longint): boolean;
// Очистка критерия
procedure ClearCriteria;

// Листинг D.6. Перевод сферических координат l,b в декартовые x,y на плоскости
(* Input: сферические координаты в радианах, Output: декартовы координаты *)
procedure Aitoff(l, b: double; var x, y: double);
// Перевод декартовых x,y в экранные u,v координаты на плоскости
procedure Screen(x, y: double; // Декартовы координаты
  X0, Y0: integer; // Экранные координаты начала декартовой системы
  Scale: double; // Масштаб - сколько точек экрана на единицу длины
  var u, v: integer); // Экранные координаты

// Листинг D.7. Рисование координатной сетки
procedure AitoffGrid(Step: integer; (* Шаг сетки в градусах *)
  X0, Y0: integer; (* Экранные координаты центра проекции *)
  Scale: double; (* Масштаб - точек на единицу длины *)
  isGrad: boolean); (* Флаг - в градусах или в часах разметка долготы *)

// Листинг D.8. Перевод экваториальных a,d в галактические l,b координаты
procedure Galaxy(a, d: double; var l, b: double);
// Листинг D.9. Построение распределения звезд по небесной сфере
procedure Picture;
// Листинг D.10. Формирование x,y,z прямоугольных галактических координат звезд
procedure Plot3D;
// Листинг D.11. Визуализация звёзд и сеточных астродиаграмм
procedure Galavoxel;

var
  GLCanvas: TGLCanvas; // Вместо TCanvas on TGLSceneViewer
  HipRec: THipparcos;
  astat: array [-12 .. +12] of longint; // статистика
  i: integer;
  r: Double; // расстояние
  m: Double; // абсолютная звездная величина
  mav: Double; // средняя абсолютная звездная величина
  n: LongInt; // количество подходящих звезд

  // 16383 - максимальное число звезд в списке
const
  MaxList = 150000;

  // Тип списка звезд
type
  PList = array [1 .. MaxList] of longint;

var
  List: ^PList; // Указатель на начало списка номеров звезд

var // was const
  NList: longint = 0; // Количество звезд в текущем списке

  // --------------------------------------------------------------------
implementation

// --------------------------------------------------------------------

function logd(x: double): double;
begin
  logd := ln(x) / ln(10.0);
end;

// --------------------------------------------------------------------

procedure Aitoff(l, b: double; var x, y: double);
var
  s: double;
begin
  if l > Pi then
    l := l - 2 * Pi; // Приведение l в диапазон -Pi до +Pi
  s := sqrt(1 + cos(b) * cos(l / 2)); // Знаменатель формул 4.1
  x := -2 * cos(b) * sin(l / 2) / s;
  y := sin(b) / s;
end;

// --------------------------------------------------------------------

procedure Screen(x, y: double; X0, Y0: integer; Scale: double;
  var u, v: integer);
begin
  u := X0 + Round(Scale * x);
  v := Y0 - Round(Scale * y);
end;


// --------------------------------------------------------------------

procedure AbsMagDistrib;
begin
  for i := low(astat) to high(astat) do
    astat[i] := 0; // обнуление статистики }
  OpenHygMain;
  while ReadHygMain(HipRec) do
  begin
    if (HipRec.info and NoPlx) <> 0 then
      continue; // нет данных о паралл.
    if HipRec.plx <= 0.0 then
      continue; // неположительный параллакс
    if HipRec.sigma.plx / HipRec.plx > 0.5 then
      continue; // точность хуже 50%
    r := 1000.0 / HipRec.plx; // Вычисление расстояния в пк
    m := HipRec.VMag - 5.0 * logd(r) + 5.0;
    // Вычисл. абсолютной звезд. величины
    i := Round(m); // Определение индекса ячейки массива
    if (i >= low(astat)) and (i <= high(astat)) then
      inc(astat[i]); // ув.на 1
  end;
  CloseHygMain;
  for i := low(astat) to high(astat) do
    writeln(i:3, astat[i]:7);
end;

// --------------------------------------------------------------------

function InitCriteria(name: string): longint;
var
  t: text; // файловая переменная
  s: string; // строка-буфер
  i: longint;
  code: integer; // код ошибки
begin
  assign(t, name);
  reset(t); // Открываем файл
  for i := 1 to 2 do
    readln(t); // Пропуск двух первых строк
  readln(t, NList); // В третьей строке - количество звезд
  if NList > MaxList then
  begin
    writeln('Слишком много звезд в списке');
    Halt;
  end;
  // Выделение памяти под список
  GetMem(List, NList * SizeOf(longint));
  for i := 4 to 12 do
    readln(t); // Пропуск с 4 по 12 строку
  for i := 1 to NList do // чтение с 3-го байта 12 байт номера
  begin
    readln(t, s);
    val(copy(s, 3, 12), List[i], code);
    if code <> 0 then
    begin
      writeln('Ошибка в формате файла. Строка ', i + 12);
      Halt;
    end;
  end;
  close(t);
  InitCriteria := NList;
end; // function


// --------------------------------------------------------------------

function InCelestia(n: longint): boolean;
var
  i: longint;
begin
  InCelestia := False; // объект пока не найден
  if NList = 0 then
    exit; // если критерий не установлен - выход
  for i := 1 to NList do // обход звезд в цикле for
    if List[i] = n then
    begin // если звезда найдена в списке
      InCelestia := True;
      break; // досрочно прервать цикл
    end;
end; // function

// --------------------------------------------------------------------

procedure ClearCriteria;
begin
  FreeMem(List, NList * SizeOf(longint));
  NList := 0;
end; // function


// --------------------------------------------------------------------

procedure Aver;
begin
  n := 0;
  mav := 0;
  OpenHygMain;
  // Инициализация критерия
  Writeln(InitCriteria('lumin.txt'), ' звёзд в критерии.');
  while ReadHygMain(HipRec) do
  begin
    if (HipRec.info and NoPlx) <> 0 then
      continue; // нет данных о паралл.
    if HipRec.plx <= 0.0 then
      Continue; // неположительный параллакс
    r := 1000.0 / HipRec.plx; // Вычисление расстояния в пк
    m := HipRec.VMag - 5.0 * logd(r) + 5.0; // Вычисл. абс. звезд. величины
    if InCelestia(HipRec.HIP) then // Звезда в списке Celestia
    begin
      mav := mav + m; // накопление суммы абс. зв. величин
      inc(n); // суммирование числа звезд
    end;
  end; // while
  ClearCriteria; // Очистка критерия
  CloseHygMain;
  mav := mav / n; // Вычисление среднего значения
  Writeln('Средняя абсолютная звёздная величина ', mav:6:2);
  Writeln('Обработано ', n, ' звёзд');
end;

// ---------------------------------------------------------------------

procedure AitoffGrid(Step: integer; X0, Y0: integer; Scale: double;
  isGrad: boolean);
var
  i, j: Integer;
  l, b: Double; // Галактические координаты
  x, y: Double; // Декартовы координаты
  u, v: Integer; // Экранные координаты
  s: string[5]; // Строка для подписей
  h: Integer; // Для разметки осей
  WindowsBitmapFont: TGLWindowsBitmapFont;
  Color: TColor; // Цвет точек, линий и др.
  rci: TGLRenderContextInfo;

begin
  GLCanvas := TGLCanvas.Create(256, 256);
  /// GLCanvas.PenWidth := vPenWidth;
  WindowsBitmapFont := TGLWindowsBitmapFont.Create(nil); // self ?

  // Нанесение сетки меридианов
  i := -180; // Первый меридиан -180 градусов
  repeat // Цикл по меридианам
    l := DegToRad(i); // Перевод в радианы
    j := -90; // Первая точка меридиана
    repeat // Цикл построения вдоль меридиана
      // Вычисление точки меридиана
      b := DegToRad(j); // Перевод в радианы широты
      Aitoff(l, b, x, y); // Перевод в декартовы координаты
      Screen(x, y, X0, Y0, Scale, u, v); // Перевод в экранные коорд.
      (* Если точка первая (j=-90), то помещаем графический курсор
        в точку (u,v) функцией MoveTo, если точка не первая, то
        ?прочерчиваем? курсором линию из предыдущей точки
        в точку (u,v) функцией LineTo *)
      if j = -90 then
        GLCanvas.MoveTo(u, v)
      else
        GLCanvas.LineTo(u, v);
      j := j + 5; // Шаг 5 градусов обеспечивают гладкий вид меридиана
    until j > 90;
    i := i + Step; // Переход к следующему меридиану
  until i > 180;
  // Нанесение сетки параллелей - аналогично предыдущему
  j := -90;
  repeat // цикл по параллелям
    b := DegToRad(j);
    i := -180;
    repeat // цикл построения вдоль параллели
      l := DegToRad(i);
      Aitoff(l, b, x, y);
      Screen(x, y, X0, Y0, Scale, u, v);
      if i = -180 then
        GLCanvas.MoveTo(u, v)
      else
        GLCanvas.LineTo(u, v);
      i := i + 5;
    until i > 180;
    j := j + Step;
  until j > 90;
  // Задание свойств шрифта (может зависеть от граф.библ.)
  /// SetTextStyle(DefaultFont, HorizDir, 1);
  /// SetTextJustify(LeftText, BottomText);
  // Подписи меридианов вдоль экватора
  i := -180;
  repeat
    // Вычисление координаты точки вывода надписи
    l := DegToRad(i);
    Aitoff(l, 0, x, y);
    Screen(x, y, X0, Y0, Scale, u, v);
    // Если isGrad истина, то разметка в градусах, иначе - в часах
    if isGrad then
      h := i
    else
    begin
      h := i div 15;
      if h < 0 then
        h := h + 24;
    end;
    Str(h, s); // Преобразование значения h в текстовую строку
    // OutTextXY(u + 5, v - 5, s); // Вывод текстовой строки
    WindowsBitmapFont.TextOut(rci, u + 5, v - 5, s, Color);
    i := i + Step; // Переход к следующему меридиану
  until i > 180;
  // Изменение выравнивания текста
  /// SetTextJustify(RightText, BottomText);
  // Подписи параллелей вдоль нулевого меридиана - аналогично
  j := -90 + Step;
  repeat
    if j <> 0 then // Экватор не подписываем
    begin
      b := DegToRad(j);
      Aitoff(0, b, x, y);
      Screen(x, y, X0, Y0, Scale, u, v);
      Str(j, s);
      // OutTextXY(u - 5, v - 5, s); // Вывод текстовой строки
      WindowsBitmapFont.TextOut(rci, u - 5, v - 5, s, Color);
    end;
    j := j + Step;
  until j > 90 - Step;

  GLCanvas.Free;
end;

// ------------------------------------------------------------------

procedure Galaxy(a, d: double; var l, b: double);
var
  sa, ca, sd, cd: double;
const
  Leo = 4.936829261; // 282.85948083
  L0 = 0.57477039907; // 32.931918056
  si = 0.88998807641; // sin 62.871748611
  ci = 0.45598379779; // cos 62.871748611
begin
  a := a - Leo;
  sa := sin(a);
  ca := cos(a);
  sd := sin(d);
  cd := cos(d);
  b := ArcSin(sd * ci - cd * si * sa);
  l := ArcTan2(sd * si + cd * ci * sa, cd * ca) + L0;
end;

// ----------------------------------------------------------------------

procedure Picture;
var
  driver, mode: integer; // Для инициализации графич. режима
  Color: TGLColorVector; // Star color
  l, b: double; // Галактические координаты, spherical
  x, y: double; // Декартовы координаты
  u, v: integer; // Экранные координаты
  CX, CY: integer; // Экранные координаты центра проекции
  SC: integer; // Масштаб перевода декартовых коорд. в экранные
begin
  // Инициализация графического режима
  GLCanvas := TGLCanvas.Create(256, 256);
  /// driver := detect;
  mode := 0;
  /// InitGraph(driver, mode, 'D:/BP/BGI');
  // Задание масштаба и центра
  // Проекция Айтофа имеет X в диапазоне от -2 до 2, и зазор
  /// SC := GetMaxX div 4 - 10;
  /// CX := GetMaxX div 2;
  /// CY := GetMaxY div 2;
  AitoffGrid(30, CX, CY, SC, True); // Вывод сетки координат
  OpenHygMain; // Открытие каталога и
  InitCriteria('I-II.txt'); // инициализация критерия
  while ReadHygMain(HipRec) do // Цикл чтения звезд
    if InCelestia(HipRec.HIP) then // Проверка критерия
    begin
      case HipRec.SP[0] of // Определение цвета звезды
        'O', 'B':
          Color := clrLightBlue;
        'A':
          Color := clrLightPurple; // was LightCyan
        'F', 'G':
          Color := clrYellow;
        'K', 'M':
          Color := clrRed; // was LightRed
      else
        Color := clrLightGray;
      end; // case
      (* Перевод экваториальных координат в радианы, а затем
        в галактические сферические координаты *)
      Galaxy(DegToRad(HipRec.RADeg), DegToRad(HipRec.DEDeg), l, b);
      // Вычисление декартовых координат проекции Айтофа
      Aitoff(l, b, x, y);
      Screen(x, y, CX, CY, SC, u, v); // Перевод в экранные координаты
      GLCanvas.PlotPixel(u, v);
      // Поставить точку цвета Color (можно заменить на круг)
    end; // if и while
  ClearCriteria;
  CloseHygMain;
  GLCanvas.Free;
end;

// ----------------------------------------------------------------------

procedure Plot3D;
const
  Criteria = 'O-B5'; // Имя файла критерия
var
  r: double; // Радиус – расстояние от солнца
  l, b: double; // Сферичесие галактические координаты
  x, y, z: double; // Декартовы галактические координаты
  f: text; // Файл вывода результатов
  n: integer; // Счетчик

begin
  n := 0;
  // Выходной файл имеет расширение .DAT }
  assign(f, Criteria + '.DAT');
  Rewrite(f);
  OpenHygMain;
  // Файл списка звезд имеет расширение .TXT
  writeln(InitCriteria(Criteria + '.txt'), ' звёзд в критерии.');
  while ReadHygMain(HipRec) do
  begin
    // нет данных о параллаксе
    if (HipRec.info and NoPlx) <> 0 then
      continue;
    // "плохое" значение параллакса
    if HipRec.plx <= 0.0 then
      continue;
    // низкая точность параллакса
    if HipRec.sigma.plx / HipRec.plx > 0.5 then
      continue;
    if InCelestia(HipRec.HIP) then
    begin
      r := 1000.0 / HipRec.plx; // Вычисление расстояния в пк
      if r > 500.0 then
        continue; // Отброс далеких звезд
      // Перевод в галактические координаты
      Galaxy(DegToRad(HipRec.RADeg), DegToRad(HipRec.DEDeg), l, b);
      x := r * cos(b) * cos(l); // Вычисление прямоугольных
      y := r * cos(b) * sin(l); // галактических координат
      z := r * sin(b);
      writeln(f, x:10:2, y:10:2, z:10:2); // Вывод в файл x,y,z или в мемо
      inc(n); // Увеличение счетчика на единицу
    end; // if
  end; // while
  ClearCriteria;
  CloseHygMain;
  Close(f);
  Writeln(n, ' звёзд обработано.');
end;

// -----------------------------------------------------------------

procedure Galavoxel;
const
  Criteria = 'O-B5'; // Имя файла
  n: integer = 0; // Счетчик
var
  s: THipparcos;
  r: double; // Расстояние
  x, y, z: double; // Декартовы галактические координаты
  f: text; // Файл вывода результатов
begin
  (* Визуализация in GLScene *)
end;

end.
