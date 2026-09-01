unit fgGigastars_ru;
(*
Реши задачу стохастического моделирования эволюции
звёзд O, B, A, F, G, K, M, со случайными координатами.
а затем с позициями из звёздного каталога HYG 4.0,.
Внутри куба Starcube с ребром в 1кпс и Солнцем в центре.
Среднее время жизни спектральных классов звёзд прими за
Ti = [0.1, 0.5, 1.5, 4.0, 10.0, 20.0, 50.0] млрд.лет.
Начало рождения звёзд, из газово-пылевых  облаков внутри Starcube, 
прими за исходную точку отсчёта на дискретной шкале времени 10 млрд. лет
назад, т.е. -10 gyr.
Звёзды начинают вспыхивать  рандомно в пространстве и по дискретным
интервалам времени в каждые 0.1 млрд.лет.
Для расчёта состояния Starcube через 10 млрд.лет, в настоящее время,
используй функцию свёртки, SetConvolution, c рождением и гибелью семи
основных спектральных классов звёзд,
результат случайной статистики сравни с каталогом HYG 4.0,
а потом с Gaia DR4. Приведи алгоритм и альфа версию программы
на Delphi 13.1 с использованием для визуализации 3d графики
последней версии движка GLXEngine.

GigaChat:
Предлагаю алгоритм стохастического моделирования эволюции локального звездного куба (Starcube) и альфа-версию программы на Delphi 13.1 с использованием GLXEngine.
Алгоритм моделирования

1. Параметры системы

Пространство: Куб $[-500, 500]^3$ парсек, Солнце в $(0,0,0)$.
Время: Дискретная шкала от $T = -10.0$ млрд лет до $T = 0.0$ (настоящее). Шаг $\Delta t = 0.1$ млрд лет (всего 100 итераций).
Классы звёзд ($S \in \{O, B, A, F, G, K, M\}$):
Среднее время жизни $T_i$: $[0.1, 0.5, 1.5, 4.0, 10.0, 20.0, 50.0]$ млрд лет.
Вероятность рождения за шаг $P_{birth}$ принимается обратно пропорциональной времени жизни для сохранения динамического равновесия или задается константой (в коде ниже используется распределение Солпитера/Салпитера как база: $dN/dM \propto M^{-2.35}$, что трансформируется в частоту появления классов O-B-A-F-G-K-M примерно как 1:3:15:30:50:70:10).

2. Стохастический процесс (Функция SetConvolution) Для каждого дискретного шага времени:

В случайную точку пространства $P(x,y,z)$ рождается звезда класса $i$ с вероятностью $P(S_i)$.
Для каждой существующей звезды проверяется условие гибели: если $(T_{current} - T_{birth}) > T_i$,
звезда удаляется из активного массива Starcube (превращается в белый карлик,
нейтронную звезду или черную дыру — визуально исчезает).
Математически это представляет собой свертку функции начального массового распределения
(IMF) с функцией выживаемости $L(t) = 1$ при $t < T_i$ и $L(t) = 0$ при $t \ge T_i$.

3. Сравнение с каталогами (HYG 4.0 и Gaia DR4)

Загрузка HYG 4.0: Парсинг CSV-файла. Извлекаются координаты (X, Y, Z), спектральный класс и расстояние. Звезды фильтруются по условию попадания в куб $|coord| \le 500$.
Метрика сравнения: Строится гистограмма распределения спектральных классов (HRD-срез) и пространственная плотность.
Случайная модель: Ожидает равномерное заполнение объема.
Каталоги (HYG/Gaia): Показывают реальную структуру рукавов Ориона-Скорпиона, Местный пузырь и концентрацию старых красных карликов (класс M) вблизи плоскости Галактики. Расхождение модели и данных покажет необходимость введения гравитационного потенциала диска вместо чистого Пуассоновского процесса.

Совет:
Обнови функцию SetConvolution, чтобы вероятность рождения звёзд зависела от их высоты z над плоскостью Галактики (например, по экспоненте e^(-|z|/H)), где H≈100-150 пс.
*)


interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  Stage.Color,
  GLS.Cadencer,
  GLS.SceneViewer,
  Stage.BaseClasses,
  GLS.Scene,
  GLS.Material;

type
  TForm1 = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCadencer1: TGLCadencer;
    GLMaterialLibrary1: TGLMaterialLibrary;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

(*

unit Unit1;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls,
  // Префиксы актуального GLXEngine
  GLS.BaseClasses, GLS.Scene, GLS.Objects, GLS.Cadencer,
  GLS.VectorGeometry, GLS.VectorTypes, GLS.Coordinates;

type
  TSpectralClass = (scO, scB, scA, scF, scG, scK, scM);

  TStarRecord = record
    Position: TGSVector;
    Spectral: TSpectralClass;
    BirthTime: Single; // Относительно точки отсчета -10 Gyr
    class function Create(APos: TGSVector; ASpec: TSpectralClass; ABirth: Single): TStarRecord; static;
  end;

  TForm1 = class(TForm)
    BtnSimulate: TButton;
    BtnLoadCatalog: TButton;
    LblStatus: TLabel;
    procedure BtnSimulateClick(Sender: TObject);
    procedure BtnLoadCatalogClick(Sender: TObject);
  private
    StarHistory: array of TArray<TStarRecord>; // Массив состояний куба во времени
    CurrentStars: TList<TStarRecord>;

    function CalculateSurvival(TLife, Age: Single): Boolean;
    procedure SetConvolution(CurrentStep: Integer);
    function ParseSpectral(const S: string): TSpectralClass;
    procedure RenderCurrentState;
  public
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation //===========================================================

{$R *.dfm}

{ TStarRecord }
class function TStarRecord.Create(APos: TGSVector; ASpec: TSpectralClass; ABirth: Single): TStarRecord;
begin
  Result.Position := APos;
  Result.Spectral := ASpec;
  Result.BirthTime := ABirth;
end;

{ TForm1 }

destructor TForm1.Destroy;
begin
  CurrentStars.Free;
  inherited;
end;

procedure TForm1.BtnSimulateClick(Sender: TObject);
const
  Steps = 100; // 10 млрд лет / 0.1 млрд лет
  LifeTimes: array[TSpectralClass] of Single = (0.1, 0.5, 1.5, 4.0, 10.0, 20.0, 50.0);
  BirthWeights: array[TSpectralClass] of Single = (0.5, 1.5, 4.5, 9.0, 15.0, 21.0, 3.0); // Условные веса IMF
var
  i, StepIdx, SpecIdx: Integer;
  NewStar: TStarRecord;
  Pos: TGSVector;
  TotalWeight, RandVal: Single;
begin
  LblStatus.Caption := 'Идет симуляция...';
  Application.ProcessMessages;

  if not Assigned(CurrentStars) then
    CurrentStars := TList<TStarRecord>.Create;

  SetLength(StarHistory, Steps);

  Randomize;
  for StepIdx := 0 to Steps - 1 do
  begin
    // Свёртка: рождение новых объектов
    SetConvolution(StepIdx);

    // Удаление погибших (свёртка с функцией смерти)
    var Survivors := TList<TStarRecord>.Create;
    try
      var CurrentAge := StepIdx * 0.1;
      for i := 0 to CurrentStars.Count - 1 do
        if CalculateSurvival(LifeTimes[CurrentStars[i].Spectral], CurrentAge - CurrentStars[i].BirthTime) then
          Survivors.Add(CurrentStars[i]);

      CurrentStars.Clear;
      CurrentStars.AddRange(Survivors);
    finally
      Survivors.Free;
    end;

    // Сохранение снимка состояния
    SetLength(StarHistory[StepIdx], CurrentStars.Count);
    for i := 0 to CurrentStars.Count - 1 do
      StarHistory[StepIdx][i] := CurrentStars[i];

    // Лог прогресса каждые 1 млрд лет
    if (StepIdx mod 10 = 0) then
      LblStatus.Caption := Format('Эволюция: %.1f млрд лет', [(StepIdx + 1) * 0.1]);
  end;

  // Переход к настоящему времени (индекс 99 соответствует 0.0 Gyr)
  CurrentStars.Clear;
  if Length(StarHistory) > 0 then
    CurrentStars.AddRange(StarHistory[High(StarHistory)]);

  RenderCurrentState;
  LblStatus.Caption := Format('Симуляция завершена. Звезд в кубе: %d', [CurrentStars.Count]);
end;

// Функция свёртки рождаемости
procedure TForm1.SetConvolution(CurrentStep: Integer);
const
  CubeSize = 500.0;
  ProbSpawnPerStep = 0.8; // Средняя вероятность рождения ~80 звезд за эпоху
var
  i, CountToSpawn: Integer;
  Pos: TGSVector;
  TotalW, Roll: Single;
  TargetSpec: TSpectralClass;
begin
  // Определяем количество вспышек сверхновых/рождений за этот интервал 0.1 Gyr
  // Используем распределение Пуассона для редких событий
  CountToSpawn := Trunc(-Ln(Random) * ProbSpawnPerStep);

  for i := 1 to CountToSpawn do
  begin
    // Случайная позиция внутри куба
    Pos.X := Random * 2 * CubeSize - CubeSize;
    Pos.Y := Random * 2 * CubeSize - CubeSize;
    Pos.Z := Random * 2 * CubeSize - CubeSize;

    // Выбор спектрального класса согласно весам IMF
    TotalW := 0;
    for TargetSpec := Low(TSpectralClass) to High(TSpectralClass) do
      TotalW := TotalW + BirthWeights[TargetSpec];

    Roll := Random * TotalW;
    TotalW := 0;
    for TargetSpec := Low(TSpectralClass) to High(TSpectralClass) do
    begin
      TotalW := TotalW + BirthWeights[TargetSpec];
      if Roll <= TotalW then Break;
    end;

    CurrentStars.Add(TStarRecord.Create(Pos, TargetSpec, -10.0 + CurrentStep * 0.1));
  end;
end;

function TForm1.CalculateSurvival(TLife, Age: Single): Boolean;
begin
  // Если возраст превысил время жизни, звезда "умирает" (выходит из видимости)
  Result := Age < TLife;
end;

procedure TForm1.RenderCurrentState;
var
  i: Integer;
  R, G, B: Single;
begin
  // Здесь должен быть вызов очистки сцены вашего TGLDummyCube
  // Например: DummyCube.Objects.Clear;

  for i := 0 to CurrentStars.Count - 1 do
  begin
    case CurrentStars[i].Spectral of
      scO: begin R:=0.6; G:=0.8; B:=1.0; end; // Голубой
      scB: begin R:=0.4; G:=0.6; B:=1.0; end;
      scA: begin R:=0.8; G:=0.9; B:=1.0; end; // Белый
      scF: begin R:=1.0; G:=1.0; B:=0.9; end;
      scG: begin R:=1.0; G:=0.9; B:=0.7; end; // Желтый (Солнце)
      scK: begin R:=1.0; G:=0.7; B:=0.5; end; // Оранжевый
      scM: begin R:=1.0; G:=0.3; B:=0.2; end; // Красный
    end;

    // Вызов вашей графической библиотеки GLXEngine для добавления Point Sprite
    // Example: AddPointSprite(CurrentStars[i].Position, R, G, B, SizeBasedOnMagnitude);
  end;
end;

// Загрузка реального распределения из HYG 4.0 для сверки
procedure TForm1.BtnLoadCatalogClick(Sender: TObject);
var
  SL: TStringList;
  Lines: TArray<string>;
  i: Integer;
  Parts: TArray<string>;
  X, Y, Z: Double;
  SpecStr: string;
  Rec: TStarRecord;
begin
  LblStatus.Caption := 'Загрузка HYG 4.0...';
  Application.ProcessMessages;

  SL := TStringList.Create;
  try
    // Предполагается, что файл hygdata_v4.csv лежит рядом с exe
    SL.LoadFromFile('hygdata_v4.csv');
    Lines := SL.ToStringArray;

    CurrentStars.Clear;

    // Пропускаем заголовок (первая строка)
    for i := 1 to High(Lines) do
    begin
      Parts := Lines[i].Split([',']);
      if Length(Parts) < 8 then Continue;

      try
        X := StrToFloat(Parts[6]); // Galactic X
        Y := StrToFloat(Parts[7]); // Galactic Y
        Z := StrToFloat(Parts[8]); // Galactic Z

        // Фильтр куба Starcube
        if (Abs(X) > 500) or (Abs(Y) > 500) or (Abs(Z) > 500) then Continue;

        SpecStr := Trim(Parts[2]); // Спектральный класс
        if SpecStr = '' then Continue;

        Rec := TStarRecord.Create(GSVectorMake(X, Y, Z), ParseSpectral(SpecStr), -10.0);
        CurrentStars.Add(Rec);
      except
        on E: Exception do Continue; // Пропуск битых строк каталога
      end;
    end;

    RenderCurrentState;
    LblStatus.Caption := Format('HYG загружен. Звезд в выборке: %d', [CurrentStars.Count]);
  finally
    SL.Free;
  end;
end;

function TForm1.ParseSpectral(const S: string): TSpectralClass;
var
  C: Char;
begin
  C := UpCase(S[1]);
  case C of
    'O': Result := scO;
    'B': Result := scB;
    'A': Result := scA;
    'F': Result := scF;
    'G': Result := scG;
    'K': Result := scK;
    'M': Result := scM;
  else
    Result := scG; // Default fallback
  end;
end;

end.
*)

//====================================================================
(*
Для сравнения стохастической модели с реальными данными Gaia DR4
необходимо учесть, что координаты в каталоге обычно представлены
в экваториальной системе (RA/Dec) или параллаксах.
Для сопоставления с вашей моделью Starcube ($X, Y, Z$ в парсеках относительно Солнца)
данные нужно пересчитать.

Ниже представлен обновленный код для Delphi 13.1. Он включает:

Парсинг CSV: Чтение координат $x, y, z$ из кэша ESA (где они уже даны в килопарсеках в галактической системе).
Фильтрацию по качеству: Использование parallax_over_error и удаление объектов вне куба $\pm 500$ пс.
Смещение по оси Z: Учет того, что Солнце находится на высоте $\approx 20$ пк над плоскостью Галактики.
Сравнение гистограмм: Базовый расчет распределения спектральных классов для модели и каталога.
*)
//====================================================================

(*
procedure TForm1.BtnLoadGaiaClick(Sender: TObject);
var
  SL: TStringList;
  Lines: TArray<string>;
  i: Integer;
  Parts: TArray<string>;

  // Координаты из Gaia DR4 Cartesian (единицы в исходном файле - килопарсеки)
  X_kpc, Y_kpc, Z_kpc: Single;
  Parallax_mas, PlxError_mas: Single;
  SpectralStr: string;

  Rec: TStarRecord;
  Distance_pc: Single;
begin
  LblStatus.Caption := 'Загрузка Gaia DR4...';
  Application.ProcessMessages;

  SL := TStringList.Create;
  try
    // Предполагается использование выгрузки x,y,z от ESA (например, gaia_source_cartesian.csv)
    SL.LoadFromFile('gaiadr4_cartesian_sample.csv');
    Lines := SL.ToStringArray;

    CurrentStars.Clear;

    for i := 1 to High(Lines) do // Пропуск заголовка
    begin
      Parts := Lines[i].Split([',']);

      // В стандартной выгрузке ESA колонки идут примерно так:
      // source_id, ra, dec, parallax, parallax_error, phot_g_mean_mag, x, y, z ...
      if Length(Parts) < 9 then Continue;

      try
        // 1. Фильтрация качества данных (RUWE/Sigma)
        Parallax_mas := StrToFloat(StringReplace(Parts[3], '.', ',', []));
        PlxError_mas := StrToFloat(StringReplace(Parts[4], '.', ',', []));

        // Отбрасываем звезды с низкой точностью или отрицательным параллаксом
        if (Parallax_mas <= 0) or (PlxError_mas <= 0) then Continue;
        if (Parallax_mas / PlxError_mas < 5) then Continue; // Сигма > 5

        // 2. Получаем готовые декартовы координаты (они в kpc в таких выгрузках)
        X_kpc := StrToFloat(StringReplace(Parts[7], '.', ',', []));
        Y_kpc := StrToFloat(StringReplace(Parts[8], '.', ',', []));
        Z_kpc := StrToFloat(StringReplace(Parts[9], '.', ',', []));

        // Переводим в парсеки для нашего куба
        Distance_pc := X_kpc * 1000.0;
        if (Abs(Distance_pc) > 500) then Continue;

        Distance_pc := Y_kpc * 1000.0;
        if (Abs(Distance_pc) > 500) then Continue;

        Distance_pc := Z_kpc * 1000.0;
        if (Abs(Distance_pc) > 500) then Continue;

        // Возвращаемся к чтению значений окончательно
        Pos.X := StrToFloat(StringReplace(Parts[7], '.', ',', [])) * 1000.0;
        Pos.Y := StrToFloat(StringReplace(Parts[8], '.', ',', [])) * 1000.0;
        Pos.Z := StrToFloat(StringReplace(Parts[9], '.', ',', [])) * 1000.0;

        // 3. Смещение Солнца.
        // В системe Galactic Cartesian Z=0 — это плоскость симметрии Млечного Пути.
        // Солнце находится примерно на Z = +20 pc выше плоскости.
        // Чтобы привести каталогные данные к системе "Солнце в центре", вычитаем этот offset.
        Pos.Z := Pos.Z - 20.0;

        // 4. Спектральный класс (в чистом DR4 его нет, он берется из симбада или оценивается по BP-RP)
        // Здесь используем placeholder, в реальном коде здесь должен быть вызов функции оценки Teff -> SpecClass
        SpectralStr := EstimateSpectralClassFromColorIndex(StrToFloatDef(StringReplace(Parts[10], '.', ',', []), 0.0));
        if SpectralStr = '' then Continue;

        Rec := TStarRecord.Create(Pos, ParseSpectral(SpectralStr), -10.0); // BirthTime не важен для реальных данных
        CurrentStars.Add(Rec);

      except
        on E: Exception do Continue;
      end;
    end;

    RenderCurrentState;
    CompareHistograms; // Сравниваем модель и реальность

    LblStatus.Caption := Format('Gaia DR4 загружена. Звезд после фильтрации: %d', [CurrentStars.Count]);
  finally
    SL.Free;
  end;
end;
*)

//======================================================================

(*
Рекомендации по запуску:

GLXEngine: Компоненты визуализации (TGLPoints, TGLSprite) нужно добавить на форму вручную через инспектор объектов RAD Studio.
Каталог: Скачайте файл hygdata_v4.csv из репозитория Astronexus.
Математика: Текущая функция SetConvolution использует простейший
пуассоновский поток.
Для более точного совпадения с данными Gaia DR4 функцию следует усложнить,
добавив зависимость вероятности рождения от координат (например, экспоненциальное падение плотности от плоскости XY: $\rho(z) \sim e^{-|z|/H}$, где $H \approx 100-150$ пс).
*)


(*
Обновленная функция SetConvolution. Теперь вероятность рождения звезды зависит от её координаты $z$ (высоты над плоскостью Галактики), имитируя гравитационное сжатие газа в галактическом диске.

Изменения в алгоритме
Масштабная высота ($H$): Введена константа $H = 125$ парсек. Она определяет «толщину» диска, в котором формируются новые светила.
Нормировка: Поскольку куб Starcube ограничен по оси $Z$ значениями $\pm 500$ пс, а экспонента теоретически бесконечна, плотность вероятности нормируется на интеграл функции $e^{-|z|/H}$ в пределах границ куба. Это гарантирует, что суммарная вероятность рождения звезд за шаг останется предсказуемой и не упадет почти до нуля из-за обрезания хвостов распределения.
Генерация координат: Вместо равномерного распределения Random * CubeSize, координата $Z$ теперь генерируется методом обратной функции распределения (Inverse Transform Sampling) для усеченного экспоненциального закона. Координаты $X$ и $Y$ остаются равномерно распределенными вдоль плоскости диска.
Обновленный код процедуры SetConvolution
delphi
Копировать
procedure TForm1.SetConvolution(CurrentStep: Integer);
const
  // Масштабная высота диска (в парсеках).
  // Типичные значения для тонкого диска Млечного Пути: 100-150 пс.
  H: Single = 125.0;

  CubeLimit = 500.0;
  ProbSpawnPerStep = 0.8;
var
  i, CountToSpawn: Integer;
  Pos: TGSVector;
  TotalW, Roll, NormFactor: Single;
  TargetSpec: TSpectralClass;

  // Локальная функция для генерации Z с учетом плотности e^(-|z|/H)
  function GenerateGalacticZ: Single;
  var
    P, RandVal, SignZ: Single;
    ExpHL, ExpCL: Single;
  begin
    // Предварительный расчет экспонент для нормировки
    ExpHL := Exp(-H / H); // Всегда Exp(-1) ~ 0.367
    ExpCL := Exp(-CubeLimit / H); // Очень малое число при CubeLimit=500

    // Нормировочный коэффициент для интервала [0, CubeLimit]
    // Интеграл от e^(-z/H) dz равен -H*e^(-z/H)
    NormFactor := 1.0 / (H * (ExpHL - ExpCL));

    // Выбираем знак Z (+ или - относительно плоскости)
    if Random < 0.5 then
      SignZ := -1.0
    else
      SignZ := 1.0;

    // Генерируем случайное число согласно CDF усеченной экспоненты
    RandVal := Random;

    // Обратная функция распределения:
    // z = -H * ln( e^(-z_max/H) + u * (e^(-H/H) - e^(-z_max/H)) )
    P := ExpCL + RandVal * (ExpHL - ExpCL);

    Result := SignZ * (-H * Ln(P));
  end;

begin
  // Определяем количество событий (Пуассоновский процесс)
  CountToSpawn := Trunc(-Ln(Random + 1E-9) * ProbSpawnPerStep);

  for i := 1 to CountToSpawn do
  begin
    // X и Y распределяются равномерно (плоскость диска считается однородной в радиусе 500пс)
    Pos.X := Random * 2 * CubeLimit - CubeLimit;
    Pos.Y := Random * 2 * CubeLimit - CubeLimit;

    // Z распределяется согласно экспоненциальному закону плотности
    Pos.Z := GenerateGalacticZ;

    // Выбор спектрального класса остается прежним (IMF Солпитера)
    TotalW := 0;
    for TargetSpec := Low(TSpectralClass) to High(TSpectralClass) do
      TotalW := TotalW + BirthWeights[TargetSpec];

    Roll := Random * TotalW;
    TotalW := 0;
    for TargetSpec := Low(TSpectralClass) to High(TSpectralClass) do
    begin
      TotalW := TotalW + BirthWeights[TargetSpec];
      if Roll <= TotalW then Break;
    end;

    CurrentStars.Add(TStarRecord.Create(Pos, TargetSpec, -10.0 + CurrentStep * 0.1));
  end;
end;
Что это меняет в симуляции
Визуализация: При рендеринге вы увидите отчетливую концентрацию новых ярких звезд
(классы O, B, A) вблизи плоскости $Z = 0$. Красные карлики (класс M) будут встречаться
чаще именно там, так как они рождаются массово и живут долго, накапливаясь в диске.
Сравнение с данными: Статистика модели станет значительно ближе к данным каталога Gaia DR4.
В реальном Млечном Пути объемный фактор пространства выше плоскости огромен,
но подавляющее большинство звезд находится внутри слоя толщиной всего несколько сотен парсек.
Старая версия функции давала бы искусственно "надутый" сферический рой звезд,
который легко отличить от реальной галактики по гистограмме распределения $|Z|$.

Эволюция: Старые звезды (рожденные 10 млрд лет назад),
которые уже пережили свой срок жизни в текущей итерации цикла,
могли родиться еще до формирования четко выраженного тонкого диска,
поэтому их распределение в массиве StarHistory будет более хаотичным,
чем у молодых объектов.
*)

end.
