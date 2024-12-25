unit udGenRandom;

(*
  Класс TfrGenerator - модифицированный генератор случайных чисел;
  генерирует случайную величину, подчиняющуюся заданному (в виде f(x)) закону распределения.
  По определению плотности вероятности требуется, чтобы

  1) f(x)>=0 в интервале [xMinCellBound..xMaxCellBound];
  2) xMinCellBound <= xMaxCellBound

  Использование:
  Особенность алгоритма в том, чтобы f(x) была ограниченной на интересующем нас интервале.
  Т.е. в виде f(x) невозможно подать функцию 1/sqrt(x) на интервале [0..1] (несмотря
  на то, что интеграл от нее на этом интервале конечен и ничто ей не мешает выступать
  в роли закона распределения)
  Нормированность от f(x) не требуется, она обеспечивается автоматически (т.е. использование
  f(x) и Const*f(x) даст один и тот же результат)

  В случае, если используемая f(x) на интересующем нас интервале не является
  унимодальной (унимодальность - это когда только один максимум), следует вместо
  GetMaxValueOfFunction использовать другую функцию!

  Используемый алгоритм без труда может быть обобщен на функции нескольких
  переменных, например, f(x,y) или f(x,y,z)
  Исходный код Сергей Пашков, 2005, https://ps300.narod.ru/fr3d/prob.htm
*)

interface

uses
  System.SysUtils;

type
  TFrequencyFunction = class
  protected
    function f(x: real): real; virtual;
    function GetMaxValueOfFunction(xMinCellBound, xMaxCellBound: real)
      : real; virtual;
  end;

  TfrGenerator = class
    constructor Create(FF: TFrequencyFunction;
      xMinCellBound, xMaxCellBound: real);
    // FF-закон распределения;  xMinCellBound, xMaxCellBound - границы интервала
  private
    function GetNewValue: real;
    // генерирует случайную величину, подчиняющуюся закону распределения, указанному в функции fFreq
  protected
    fFreq: TFrequencyFunction;
    // плотность распределения, заданная в виде f(x), нормированность не требуется
    xMin: real; // нижняя граница диапазона
    xMax: real; // верхняя граница диапазона
    fMax: real; // максимальное значение f(x) в указанном диапазоне
  public
    property Value: real read GetNewValue;
  end;

implementation


function TFrequencyFunction.f(x: real): real;
begin
  Result := 1;
end;

// определение максимального значения f(x) в указанном диапазоне
// используется метод деления отрезка пополам
// метод рассчитан на нахождение максимума только для унимодальных функций
function TFrequencyFunction.GetMaxValueOfFunction(xMinCellBound,
  xMaxCellBound: real): real;
const
  eps = 0.001; // относительная точность нахождения максимума
var
  yMin, yMax, x1_4, x3_4: real;
  fLeft, fRight: real;
begin
  yMin := xMinCellBound;
  yMax := xMaxCellBound;
  fLeft := f(yMin);
  fRight := f(yMax);

  Result := f((yMin + yMax) / 2);

  while abs(Result - fLeft) + abs(Result - fRight) > eps * Result do
  begin

    x1_4 := (3 * yMin + yMax) / 4;
    x3_4 := (yMin + 3 * yMax) / 4;

    if (Result > fLeft) and (Result > fRight) then
    begin

      if f(x1_4) > Result then
      begin
        yMax := (yMin + yMax) / 2;
        fRight := Result;
      end
      else
      begin
        if f(x3_4) > Result then
        begin
          yMin := (yMin + yMax) / 2;
          fLeft := Result;
        end
        else
        begin
          yMin := x1_4;
          fLeft := f(yMin);
          yMax := x3_4;
          fRight := f(yMax);
        end;
      end;

    end
    else
    begin
      if Result < fLeft then
      begin
        yMax := (yMin + yMax) / 2;
        fRight := Result;
      end
      else
      begin
        yMin := (yMin + yMax) / 2;
        fLeft := Result;
      end;
    end;

    Result := f((yMin + yMax) / 2);
  end;
end;

constructor TfrGenerator.Create(FF: TFrequencyFunction;
  xMinCellBound, xMaxCellBound: real);
begin
  fFreq := FF;

  if xMin > xMax then
    raise Exception.Create
      ('TfrGenerator.Create: xMinCellBound can not be greater, than xMaxCellBound');

  xMin := xMinCellBound;
  xMax := xMaxCellBound;

  fMax := FF.GetMaxValueOfFunction(xMinCellBound, xMaxCellBound);

  // если не вызвать функцию Randomize, то при каждом запуске программы TfrGenerator
  // будет выдавать одну и ту же последовательность
  Randomize;
end;

// генерирует случайную величину, подчиняющуюся закону распределения,
// указанному в функции fFreq
function TfrGenerator.GetNewValue: real;
var
  NewValue: real;
begin
  repeat
    NewValue := (xMax - xMin) * Random + xMin;
  until fMax * Random < fFreq.f(NewValue);

  Result := NewValue;
end;

end.
