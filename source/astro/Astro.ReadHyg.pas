(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit Astro.ReadHyg;

// Reading Hipparcos catalog

interface

uses
  System.Math,
  System.SysUtils;

const
  // Битовые константы флага о наличии информации
  NoRaDe = 1; // Нет данных о точных координатах
  NoPlx = 2; // Нет данных о параллаксе
  Nopm = 4; // Нет данных о собственных движениях
  NoVMag = 8; // Нет данных о звездной величине
  NoB_V = 16; // Нет данных о показателе цвета

type
  THipparcos = record
    HIP: longint; // Номер звезды по Hipparcos
    // Астрометрическая информация
    RAdeg, DEdeg: double; // Экваториальные координаты в градусах
    Plx: double; // Тригонометрический параллакс в mas
    pmRa, pmDE: double; // Собств. движ. ma*cos(d) и md mas/год
    AstroRef: char; // Флаг для кратных систем
    // Фотометрическая инфомация
    VMag: single; // Звездная вел. по шкале Джонсона
    B_V: single; // Показатель цвета B-V по шкале Джонсона

    sigma: record // ошибки соотв. величин
      RAdeg, DEdeg: double;
      Plx: double;
      pmRa, pmDE: double;
    end;

    Sp: array [0 .. 9] of char; // Развернутый спектральный класс
    Info: integer; // Битовый флаг отсутствия информации
  end;

// Листинг D.1. чтение каталога Hipparcos
procedure OpenHygMain; // Открытие файла каталога
procedure CloseHygMain; // Закрытие файла каталога
(* Чтение одной строчки каталога: Результат помещается в s,
  возвращает false при достижении конца файла *)
function ReadHygMain(var s: THipparcos): boolean;

implementation // -----------------------------------------------------------

type
  THipStr = array [1 .. 452] of char; // Тип строчки каталога

var
  f: file of THipStr; // Файловая переменная каталога
  DataDir, HygName: TFileName; //'..\catalog\hyg.csv'; // old - '..\hip_main.dat';

const
  HygNumOfStars = 119615; // old - 118218;


// ------------------------------------------------------------
// Открытие файла каталога в режиме "только чтение"
procedure OpenHygMain;
begin
  DataDir := ExtractFilePath(ParamStr(0)) + 'data\';;
  HygName := DataDir + 'catalog\hygstars.csv';
  FileMode := 0; // Read only
  Assign(f, HygName);
  Reset(f);
end;

// ------------------------------------------------------------
// Закрытие файла каталога
procedure CloseHygMain;
begin
  Close(f);
end;

// ------------------------------------------------------------
// Чтение одной записи
function ReadHygMain(var s: THipparcos): boolean;
// Локальные переменные функции
var
  hs: THipStr; // Строчка каталога
  st: array [0 .. 15] of char; // вспомогательный буфер
  code: integer; // код ошибки при преобразовании в число
  i: integer; // вспомогательная переменная
begin
  // Если достигнут конец файла, то возвращаем False
  if eof(f) then
    ReadHygMain := false
  else
  begin
    ReadHygMain := true; // Результат функции - true
    read(f, hs); // Чтение одной строчки каталога
    with s do // Операции с полями структуры s
    begin
      Info := 0; // Обнуление всех битов флага
      (* + Операция @ обозначает адрес.
        + Процедура Val преобразует текстовую строку в число,
        code отличается от нуля в случае ошибки преобразования.
        + Функция StrLCopy копирует подстроку с указанием
        стартовой позиции и количества байт. *)
      // Интерпретация 12 байт, начиная с 3-го - это номер HIP.
      val(StrLCopy(st, @hs[3], 12), HIP, code);
      // Чтение координат: по 12 байт с 52 и с 65 позиции.
      val(StrLCopy(st, @hs[52], 12), RAdeg, code);
      if code <> 0 then
        Info := NoRaDe;
      val(StrLCopy(st, @hs[65], 12), DEdeg, code);
      if code <> 0 then
        Info := NoRaDe;
      // Чтение параллакса - 7 байт с 80-й позиции
      val(StrLCopy(st, @hs[80], 7), Plx, code);
      if code <> 0 then
        Info := Info or NoPlx;
      // Чтение собственных движений: по 8 байт с 88 и с 97 позиции
      val(StrLCopy(st, @hs[88], 8), pmRa, code);
      if code <> 0 then
        Info := Info or Nopm;
      val(StrLCopy(st, @hs[97], 8), pmDE, code);
      if code <> 0 then
        Info := Info or Nopm;
      s.AstroRef := hs[78]; // Флаг кратной звезды
      // Чтение зв.величины и показателя цвета B-V по шкале Джонсона
      val(StrLCopy(st, @hs[42], 5), VMag, code);
      if code <> 0 then
        Info := Info or NoVMag;
      val(StrLCopy(st, @hs[246], 6), B_V, code);
      if code <> 0 then
        Info := Info or NoB_V;
      // Чтение ошибок соотв. величин
      with sigma do
      begin
        if (Info and NoRaDe) = 0 then
        begin
          (* Данные об ошибках всегда присутствуют,
            если присутствуют и сами координаты. *)
          val(StrLCopy(st, @hs[106], 6), RAdeg, code);
          val(StrLCopy(st, @hs[113], 6), DEdeg, code);
        end;
        if (Info and NoPlx) = 0 then
        begin
          val(StrLCopy(st, @hs[120], 6), Plx, code);
        end;
        if (Info and Nopm) = 0 then
        begin
          val(StrLCopy(st, @hs[127], 6), pmRa, code);
          val(StrLCopy(st, @hs[134], 6), pmDE, code);
        end;
      end; // with sigma
      // Чтение данных о спектральном классе
      for i := 0 to 9 do
        Sp[i] := hs[436 + i];
    end; // with s
  end; // if eof(f)
end; // function

end.
