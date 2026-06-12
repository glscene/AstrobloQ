unit Litho.Utils;

(* Miscellaneous support utilities & classes for localization *)

interface

uses
  Winapi.Windows,
  Winapi.ShellApi,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  System.Math,
  Vcl.Controls,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtDlgs,

  Stage.VectorGeometry,
  Stage.Strings,
  GLS.Canvas,
  GLS.WindowsFont,
  GLS.RenderContextInfo,
  Stage.Color,

  Astro.ReadHyg;

type
  THalfFloat = type Word;
  PHalfFloat = ^THalfFloat;
  EGLOSError = EOSError;
  EGLUtilsException = class(Exception);
  TSqrt255Array = array [0 .. 255] of Byte;
  PSqrt255Array = ^TSqrt255Array;
  TProjectTargetNameFunc = function(): string;


const
  FONT_CHARS_COUNT = 2024;


var
  IsDesignTime: Boolean = False;
  vProjectTargetName: TProjectTargetNameFunc;
  vLastProjectTargetName: string;


function GetAssetsPath(): TFileName;
function GetDataPath(): TFileName;

// Copies the values of Source to Dest (converting word values to integer values)
procedure WordToIntegerArray(Source: PWordArray; Dest: PIntegerArray;
  Count: Cardinal);
// Round ups to the nearest power of two, value must be positive
function RoundUpToPowerOf2(value: Integer): Integer;
// Round down to the nearest power of two, value must be strictly positive
function RoundDownToPowerOf2(value: Integer): Integer;
// Returns True if value is a true power of two
function IsPowerOf2(value: Integer): Boolean;
// Read a CRLF terminated string from a stream. The CRLF is NOT in the returned string.
function ReadCRLFString(aStream: TStream): String;
// Write the string and a CRLF in the stream
procedure WriteCRLFString(aStream: TStream; const aString: String);
// Similar to SysUtils.StrToFloatDef, but ignores user's locale
function StrToFloatDef(const strValue: string; defValue: Extended = 0)
  : Extended;
// Trying to read string otherwise using '.' as Decimal Separator
function Str2Float(const S: string): Single;
// Converts a string into color
function StringToColorAdvancedSafe(const Str: string;
  const Default: TColor): TColor;
// Converts a string into color
function TryStringToColorAdvanced(const Str: string;
  var OutColor: TColor): Boolean;
// Converts a string into color
function StringToColorAdvanced(const Str: string): TColor;
(* Parses the next integer in the string.
  Initial non-numeric characters are skipper, p is altered, returns 0 if none
  found. '+' and '-' are acknowledged. *)
function ParseInteger(var p: PChar): Integer;
(* Parses the next integer in the string.
  Initial non-numeric characters are skipper, p is altered, returns 0 if none
  found. Both '.' and ',' are accepted as decimal separators. *)
function ParseFloat(var p: PChar): Extended;
// Saves ansistring "data" to "filename".
procedure SaveAnsiStringToFile(const fileName: string; const data: AnsiString);
// Returns the ansistring content of "filename".
function LoadAnsiStringFromFile(const fileName: string): AnsiString;
// Saves string "data" to "filename".
procedure SaveStringToFile(const fileName: string; const data: String);
// Returns the string content of "filename".
function LoadStringFromFile(const fileName: string): String;
// Saves component to a file.
procedure SaveComponentToFile(const Component: TComponent;
  const fileName: string; const AsText: Boolean = True);
// Loads component from a file.
procedure LoadComponentFromFile(const Component: TComponent;
  const fileName: string; const AsText: Boolean = True);
(* Returns the size of "filename".
  Returns 0 (zero) is file does not exists. *)
function SizeOfFile(const fileName: string): Int64;
// Returns a pointer to an array containing the results of "255*sqrt(i/255)".
function GetSqrt255Array: PSqrt255Array;
// Pops up a simple dialog with msg and an Ok button.
procedure InformationDlg(const msg: string);
(* Pops up a simple question dialog with msg and yes/no buttons.
  Returns True if answer was "yes". *)
function QuestionDlg(const msg: string): Boolean;
// Posp a simple dialog with a string input.
function InputDlg(const aCaption, aPrompt, aDefault: string): string;
// Pops up a simple save picture dialog.
function SavePictureDialog(var aFileName: string;
  const aTitle: string = ''): Boolean;
// Pops up a simple open picture dialog.
function OpenPictureDialog(var aFileName: string;
  const aTitle: string = ''): Boolean;
// Rectangle as function
function GetGLRect(const aLeft, aTop, aRight, aBottom: Integer): TRect;
(* Increases or decreases the width and height of the specified rectangle.
  Adds dx units to the left and right ends of the rectangle and dy units to
  the top and bottom. *)
procedure InflateGLRect(var aRect: TRect; dx, dy: Integer);
procedure IntersectGLRect(var aRect: TRect; const rect2: TRect);
procedure RaiseLastOSError;
(* Number of pixels per logical inch along the screen width for the device.
  Under Win32 awaits a HDC and returns its LOGPIXELSX. *)
function GetDeviceLogicalPixelsX(device: HDC): Integer;
// Number of bits per pixel for the current desktop resolution.
function GetCurrentColorDepth: Integer;
// Returns the number of color bits associated to the given pixel format.
function PixelFormatToColorBits(aPixelFormat: TPixelFormat): Integer;
// Replace path delimiter to delimiter of the current platform.
procedure FixPathDelimiter(var S: string);
// Remove if possible part of path witch leads to project executable.
function RelativePath(const S: string): string;
(* Returns the current value of the highest-resolution counter.
  If the platform has none, should return a value derived from the highest
  precision time reference available, avoiding, if possible, timers that
  allocate specific system resources. *)
procedure QueryPerformanceCounter(out val: Int64);
(* Returns the frequency of the counter used by QueryPerformanceCounter.
  Return value is in ticks per second (Hz), returns False if no precision
  counter is available. *)
function QueryPerformanceFrequency(out val: Int64): Boolean;
(* Starts a precision timer.
  Returned value should just be considered as 'handle', even if it ain't so.
  Default platform implementation is to use QueryPerformanceCounter and
  QueryPerformanceFrequency, if higher precision references are available,
  they should be used. The timer will and must be stopped/terminated/released
  with StopPrecisionTimer. *)
function StartPrecisionTimer: Int64;
// Computes time elapsed since timer start. Return time lap in seconds.
function PrecisionTimerLap(const precisionTimer: Int64): Double;
// Computes time elapsed since timer start and stop timer. Return time lap in seconds.
function StopPrecisionTimer(const precisionTimer: Int64): Double;
// Returns time in milisecond from application start.
function AppTime: Double;
// Returns the number of CPU cycles since startup. Use the similarly named CPU instruction.
function GLOKMessageBox(const Text, Caption: string): Integer;
procedure GLLoadBitmapFromInstance(Instance: LongInt; ABitmap: TBitmap;
  const AName: string);
procedure ShowHTMLUrl(const Url: string);
procedure SetExeDirectory;
// StrUtils.pas
function AnsiStartsText(const ASubText, AText: string): Boolean;
// Classes.pas
function IsSubComponent(const AComponent: TComponent): Boolean; inline;
procedure MakeSubComponent(const AComponent: TComponent; const value: Boolean);
function FindUnitName(anObject: TObject): string; overload;
function FindUnitName(aClass: TClass): string; overload;
function FloatToHalf(Float: Single): THalfFloat;
function HalfToFloat(Half: THalfFloat): Single;
function GetValueFromStringsIndex(const AStrings: TStrings;
  const AIndex: Integer): string;
// Determine if the directory is writable.
function IsDirectoryWriteable(const AName: string): Boolean;
function CharToWideChar(const AChar: AnsiChar): WideChar;
(*
  Added by PAL to fix problem with decimal separator in not En-US configurations
  Decimal separator in text descriptions of meshes for import/export is always '.' char
  But in System.SysUtils.TextToFloat is Windows char, maybe ',' or others...
*)
function GLStrToFloatDef(const S: string; const Default: Extended;
  fs: TFormatSettings): Extended; overload;
function GLStrToFloatDef(const S: string; const Default: Extended)
  : Extended; overload;
function GLStrToFloatDef(const S: string): Extended; overload;


// Реализация функции вычисления десятичного логарифма
function logd(x: double): double;

// Вычисление распределения звезд по абсолютной звездной величине
procedure AbsMagDistrib;

// Вычисление средней абсолютной звездной величины звезд,
// список которых находится в файле lumin.txt
procedure Aver;

// Исходный текст функций InitCriteria, InCelestia, ClearCriteria
(* Инициализация критерия с использованием выходного файла программы
  Celestia 2000. name - имя файла. Возвращает число звезд в списке *)
function InitCriteria(name: string): longint;
// Функция проверяет, есть ли звезда в списке
function InCelestia(n: longint): boolean;
// Очистка критерия
procedure ClearCriteria;

// Перевод сферических координат l,b в декартовые x,y на плоскости
(* Input: сферические координаты в радианах, Output: декартовы координаты *)
procedure Aitoff(l, b: double; var x, y: double);

// Перевод декартовых x,y в экранные u,v координаты на плоскости
procedure ScreenUV(x, y: double; // Декартовы координаты
  X0, Y0: integer; // Экранные координаты начала декартовой системы
  Scale: double; // Масштаб - сколько точек экрана на единицу длины
  var u, v: integer); // Экранные координаты

// Рисование координатной сетки
procedure AitoffGrid(Step: integer; (* Шаг сетки в градусах *)
  X0, Y0: integer; (* Экранные координаты центра проекции *)
  Scale: double; (* Масштаб - точек на единицу длины *)
  isGrad: boolean); (* Флаг - в градусах или в часах разметка долготы *)

// Перевод экваториальных a,d в галактические l,b координаты
procedure Galaxy(a, d: double; var l, b: double);
// Построение распределения звезд по небесной сфере
procedure Picture;
// Формирование x,y,z прямоугольных галактических координат звезд
procedure Plot3D;
// Визуализация звёзд и сеточных астродиаграмм
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

  // 16383 - ??? максимальное число звезд в списке
const
  MaxList = 150000;

  // Тип списка звезд
type
  PList = array [1 .. MaxList] of longint;

var
  List: ^PList; // Указатель на начало списка номеров звезд

var // was const
  NList: longint = 0; // Количество звезд в текущем списке


implementation // ============================================================

var
  vSqrt255: TSqrt255Array;
  vInvPerformanceCounterFrequency: Double;
  vInvPerformanceCounterFrequencyReady: Boolean = False;

//------------------------------------------------------------------------
function GetAssetsPath(): TFileName;
var
  Path: TFileName;
  N: Integer;
begin
  Path := LowerCase(ExtractFilePath(ParamStr(0)));
  N := Pos('astrobloq', Path);
  Delete(Path, N + Length('astrobloq'), Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'assets\';
  SetCurrentDir(Path);
  Result := Path;
end;

function GetDataPath(): TFileName;
var
  Path: TFileName;
  N: Integer;
begin
  Path := LowerCase(ExtractFilePath(ParamStr(0)));
  N := Pos('astrobloq', Path);
  Delete(Path, N + Length('astrobloq'), Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'data\';
  SetCurrentDir(Path);
  Result := Path;
end;

//------------------------------------------------------------------------
procedure WordToIntegerArray(Source: PWordArray; Dest: PIntegerArray;
  Count: Cardinal);
var
  i: Integer;
begin
  for i := 0 to Count - 1 do
    Dest^[i] := Source^[i];
end;

function RoundUpToPowerOf2(value: Integer): Integer;
begin
  Result := 1;
  while (Result < value) do
    Result := Result shl 1;
end;

function RoundDownToPowerOf2(value: Integer): Integer;
begin
  if value > 0 then
  begin
    Result := 1 shl 30;
    while Result > value do
      Result := Result shr 1;
  end
  else
    Result := 1;
end;

function IsPowerOf2(value: Integer): Boolean;
begin
  Result := (RoundUpToPowerOf2(value) = value);
end;

function ReadCRLFString(aStream: TStream): String;
var
  c: Char;
begin
  Result := '';
  while Copy(Result, Length(Result) - 1, 2) <> #13#10 do
  begin
    aStream.Read(c, 1);
    Result := Result + c;
  end;
  Result := Copy(Result, 1, Length(Result) - 2);
end;

procedure WriteCRLFString(aStream: TStream; const aString: String);
const
  cCRLF: Integer = $0A0D;
begin
  with aStream do
  begin
    Write(aString[1], Length(aString));
    Write(cCRLF, 2);
  end;
end;

function StrToFloatDef(const strValue: string; defValue: Extended = 0)
  : Extended;
begin
  if not TryStrToFloat(strValue, Result) then
    Result := defValue;
end;

function Str2Float(const S: string): Single;
var
  DSeparator: Char;
  fs: TFormatSettings;
begin
  DSeparator := fs.DecimalSeparator;                                                                                                   fs.DecimalSeparator := ',';
  try
    fs.DecimalSeparator := ',';
    if not TryStrToFloat(S, Result, fs) then
    begin
      fs.DecimalSeparator := '.';
      if not TryStrToFloat(S, Result, fs) then
        Result := 0;
    end;
  finally
    fs.DecimalSeparator := DSeparator;
  end;
end;

function StringToColorAdvancedSafe(const Str: string;
  const Default: TColor): TColor;
begin
  if not TryStringToColorAdvanced(Str, Result) then
    Result := Default;
end;

function StringToColorAdvanced(const Str: string): TColor;
begin
  if not TryStringToColorAdvanced(Str, Result) then
    raise EGLUtilsException.CreateResFmt(@strInvalidColor, [Str]);
end;

function TryStringToColorAdvanced(const Str: string;
  var OutColor: TColor): Boolean;
var
  Code, i: Integer;
  Temp: string;
begin
  Result := True;
  Temp := Str;
  val(Temp, i, Code); // to see if it is a number
  if Code = 0 then
    OutColor := TColor(i) // Str = $0000FF
  else
  begin
    if not IdentToColor(Temp, LongInt(OutColor)) then // Str = clRed
    begin
      if AnsiStartsText('clr', Temp) then // Str = clrRed
      begin
        Delete(Temp, 3, 1);
        if not IdentToColor(Temp, LongInt(OutColor)) then
          Result := False;
      end
      else if not IdentToColor('cl' + Temp, LongInt(OutColor)) then // Str = Red
        Result := False;
    end;
  end;
end;

function ParseInteger(var p: PChar): Integer;
var
  neg: Boolean;
  c: Char;
begin
  Result := 0;
  if p = nil then
    Exit;
  neg := False;
  // skip non-numerics
  while not CharInSet(p^, [#0, '0' .. '9', '+', '-']) do
    Inc(p);
  c := p^;
  if c = '+' then
    Inc(p)
  else if c = '-' then
  begin
    neg := True;
    Inc(p);
  end;
  // Parse numerics
  while True do
  begin
    c := p^;
    if not CharInSet(c, ['0' .. '9']) then
      Break;
    Result := Result * 10 + Integer(c) - Integer('0');
    Inc(p);
  end;
  if neg then
    Result := -Result;
end;

function ParseFloat(var p: PChar): Extended;
var
  decimals, expSign, exponent: Integer;
  c: Char;
  neg: Boolean;
begin
  Result := 0;
  if p = nil then
    Exit;
  // skip non-numerics
  while not CharInSet(p^, [#0, '0' .. '9', '+', '-']) do
    Inc(p);
  c := p^;
  if c = '+' then
  begin
    neg := False;
    Inc(p);
  end
  else if c = '-' then
  begin
    neg := True;
    Inc(p);
  end
  else
    neg := False;
  // parse numbers
  while CharInSet(p^, ['0' .. '9']) do
  begin
    Result := Result * 10 + (Integer(p^) - Integer('0'));
    Inc(p);
  end;
  // parse dot, then decimals, if any
  decimals := 0;
  if (p^ = '.') then
  begin
    Inc(p);
    while CharInSet(p^, ['0' .. '9']) do
    begin
      Result := Result * 10 + (Integer(p^) - Integer('0'));
      Inc(p);
      Dec(decimals);
    end;
  end;
  // parse exponent, if any
  if CharInSet(p^, ['e', 'E']) then
  begin
    Inc(p);
    // parse exponent sign
    c := p^;
    if c = '-' then
    begin
      expSign := -1;
      Inc(p);
    end
    else if c = '+' then
    begin
      expSign := 1;
      Inc(p);
    end
    else
      expSign := 1;
    // parse exponent
    exponent := 0;
    while CharInSet(p^, ['0' .. '9']) do
    begin
      exponent := exponent * 10 + (Integer(p^) - Integer('0'));
      Inc(p);
    end;
    decimals := decimals + expSign * exponent;
  end;
  if decimals <> 0 then
    Result := Result * Exp(decimals * Ln(10));
  if neg then
    Result := -Result;
end;

procedure SaveAnsiStringToFile(const fileName: string; const data: AnsiString);
var
  n: Cardinal;
  fs: TStream;
begin
  fs := TFileStream.Create(fileName, fmCreate);
  try
    n := Length(data);
    if n > 0 then
      fs.Write(data[1], n);
  finally
    fs.Free;
  end;
end;

function LoadAnsiStringFromFile(const fileName: string): AnsiString;
var
  n: Cardinal;
  fs: TStream;
begin
  if FileExists(fileName) then
  begin
    fs := TFileStream.Create(fileName, fmOpenRead + fmShareDenyNone);
    try
      n := fs.Size;
      SetLength(Result, n);
      if n > 0 then
        fs.Read(Result[1], n);
    finally
      fs.Free;
    end;
  end
  else
    Result := '';
end;

procedure SaveStringToFile(const fileName: string; const data: String);
var
  n: Cardinal;
  fs: TStream;
begin
  fs := TFileStream.Create(fileName, fmCreate);
  try
    n := Length(data);
    if n > 0 then
      fs.Write(data[1], n);
  finally
    fs.Free;
  end;
end;

function LoadStringFromFile(const fileName: string): String;
var
  n: Cardinal;
  fs: TStream;
begin
  if FileExists(fileName) then
  begin
    fs := TFileStream.Create(fileName, fmOpenRead + fmShareDenyNone);
    try
      n := fs.Size;
      SetLength(Result, n);
      if n > 0 then
        fs.Read(Result[1], n);
    finally
      fs.Free;
    end;
  end
  else
    Result := '';
end;

procedure SaveComponentToFile(const Component: TComponent;
  const fileName: string; const AsText: Boolean);
var
  Stream: TStream;
  MemStream: TMemoryStream;
begin
  Stream := TFileStream.Create(fileName, fmCreate);
  try
    if AsText then
    begin
      MemStream := TMemoryStream.Create;
      try
        MemStream.WriteComponent(Component);
        MemStream.Position := 0;
        ObjectBinaryToText(MemStream, Stream);
      finally
        MemStream.Free;
      end;
    end
    else
      Stream.WriteComponent(Component);
  finally
    Stream.Free;
  end;
end;

procedure LoadComponentFromFile(const Component: TComponent;
  const fileName: string; const AsText: Boolean = True);
var
  Stream: TStream;
  MemStream: TMemoryStream;
begin
  Stream := TFileStream.Create(fileName, fmOpenRead);
  try
    if AsText then
    begin
      MemStream := TMemoryStream.Create;
      try
        ObjectTextToBinary(Stream, MemStream);
        MemStream.Position := 0;
        MemStream.ReadComponent(Component);
      finally
        MemStream.Free;
      end;
    end
    else
      Stream.ReadComponent(Component);
  finally
    Stream.Free;
  end;
end;

function SizeOfFile(const fileName: string): Int64;
var
  fs: TStream;
begin
  if FileExists(fileName) then
  begin
    fs := TFileStream.Create(fileName, fmOpenRead + fmShareDenyNone);
    try
      Result := fs.Size;
    finally
      fs.Free;
    end;
  end
  else
    Result := 0;
end;

function GetSqrt255Array: PSqrt255Array;
const
  cOneDiv255 = 1 / 255;
var
  i: Integer;
begin
  if vSqrt255[255] <> 255 then
  begin
    for i := 0 to 255 do
      vSqrt255[i] := Integer(Trunc(255 * Sqrt(i * cOneDiv255)));
  end;
  Result := @vSqrt255;
end;

procedure InformationDlg(const msg: string);
begin
  ShowMessage(msg);
end;

function QuestionDlg(const msg: string): Boolean;
begin
  Result := (MessageDlg(msg, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
end;

function InputDlg(const aCaption, aPrompt, aDefault: string): string;
begin
  Result := InputBox(aCaption, aPrompt, aDefault);
end;

function SavePictureDialog(var aFileName: string;
  const aTitle: string = ''): Boolean;
var
  saveDialog: TSavePictureDialog;
begin
  saveDialog := TSavePictureDialog.Create(nil);
  try
    with saveDialog do
    begin
      Options := [ofHideReadOnly, ofNoReadOnlyReturn];
      if aTitle <> '' then
        Title := aTitle;
      fileName := aFileName;
      Result := Execute;
      if Result then
        aFileName := fileName;
    end;
  finally
    saveDialog.Free;
  end;
end;

function OpenPictureDialog(var aFileName: string;
  const aTitle: string = ''): Boolean;
var
  openDialog: TOpenPictureDialog;
begin
  openDialog := TOpenPictureDialog.Create(nil);
  try
    with openDialog do
    begin
      Options := [ofHideReadOnly, ofNoReadOnlyReturn];
      if aTitle <> '' then
        Title := aTitle;
      fileName := aFileName;
      Result := Execute;
      if Result then
        aFileName := fileName;
    end;
  finally
    openDialog.Free;
  end;
end;

procedure RaiseLastOSError;
var
  e: EGLOSError;
begin
  e := EGLOSError.Create('OS Error : ' + SysErrorMessage(GetLastError));
  raise e;
end;

function IsSubComponent(const AComponent: TComponent): Boolean;
begin
  Result := (csSubComponent in AComponent.ComponentStyle);
end;

procedure MakeSubComponent(const AComponent: TComponent; const value: Boolean);
begin
  AComponent.SetSubComponent(value);
end;

function AnsiStartsText(const ASubText, AText: string): Boolean;
begin
  Result := AnsiStartsText(ASubText, AText);
end;

function GLOKMessageBox(const Text, Caption: string): Integer;
begin
  Result := Application.MessageBox(PChar(Text), PChar(Caption), MB_OK);
end;

procedure GLLoadBitmapFromInstance(Instance: LongInt; ABitmap: TBitmap;
  const AName: string);
begin
  ABitmap.Handle := LoadBitmap(Instance, PChar(AName));
end;

procedure ShowHTMLUrl(const Url: string);
begin
  ShellExecute(0, 'open', PChar(Url), nil, nil, SW_SHOW);
end;

function GetGLRect(const aLeft, aTop, aRight, aBottom: Integer): TRect;
begin
  Result.Left := aLeft;
  Result.Top := aTop;
  Result.Right := aRight;
  Result.Bottom := aBottom;
end;

procedure InflateGLRect(var aRect: TRect; dx, dy: Integer);
begin
  aRect.Left := aRect.Left - dx;
  aRect.Right := aRect.Right + dx;
  if aRect.Right < aRect.Left then
    aRect.Right := aRect.Left;
  aRect.Top := aRect.Top - dy;
  aRect.Bottom := aRect.Bottom + dy;
  if aRect.Bottom < aRect.Top then
    aRect.Bottom := aRect.Top;
end;

procedure IntersectGLRect(var aRect: TRect; const rect2: TRect);
var
  a: Integer;
begin
  if (aRect.Left > rect2.Right) or (aRect.Right < rect2.Left) or
    (aRect.Top > rect2.Bottom) or (aRect.Bottom < rect2.Top) then
  begin
    // no intersection
    a := 0;
    aRect.Left := a;
    aRect.Right := a;
    aRect.Top := a;
    aRect.Bottom := a;
  end
  else
  begin
    if aRect.Left < rect2.Left then
      aRect.Left := rect2.Left;
    if aRect.Right > rect2.Right then
      aRect.Right := rect2.Right;
    if aRect.Top < rect2.Top then
      aRect.Top := rect2.Top;
    if aRect.Bottom > rect2.Bottom then
      aRect.Bottom := rect2.Bottom;
  end;
end;

type
  TDeviceCapabilities = record
    Xdpi, Ydpi: Integer; // Number of pixels per logical inch.
    Depth: Integer; // The bit depth.
    NumColors: Integer; // Number of entries in the device's color table.
  end;

function GetDeviceCapabilities: TDeviceCapabilities;
var
  device: HDC;
begin
  device := GetDC(0);
  try
    Result.Xdpi := GetDeviceCaps(device, LOGPIXELSX);
    Result.Ydpi := GetDeviceCaps(device, LOGPIXELSY);
    Result.Depth := GetDeviceCaps(device, BITSPIXEL);
    Result.NumColors := GetDeviceCaps(device, NumColors);
  finally
    ReleaseDC(0, device);
  end;
end;

function GetDeviceLogicalPixelsX(device: HDC): Integer;
begin
  Result := GetDeviceCapabilities().Xdpi;
end;

function GetCurrentColorDepth: Integer;
begin
  Result := GetDeviceCapabilities().Depth;
end;

function PixelFormatToColorBits(aPixelFormat: TPixelFormat): Integer;
begin
  case aPixelFormat of
    pfCustom{$IFDEF WIN32}, pfDevice{$ENDIF}: // use current color depth
      Result := GetCurrentColorDepth;
    pf1bit:
      Result := 1;
{$IFDEF WIN32}
    pf4bit:
      Result := 4;
    pf15bit:
      Result := 15;
{$ENDIF}
    pf8bit:
      Result := 8;
    pf16bit:
      Result := 16;
    pf32bit:
      Result := 32;
  else
    Result := 24;
  end;
end;

procedure FixPathDelimiter(var S: string);
var
  i: Integer;
begin
  for i := Length(S) downto 1 do
    if (S[i] = '/') or (S[i] = '\') then
      S[i] := PathDelim;
end;

function RelativePath(const S: string): string;
var
  path: string;
begin
  Result := S;
  if IsDesignTime then
  begin
    if Assigned(vProjectTargetName) then
    begin
      path := vProjectTargetName();
      if Length(path) = 0 then
        path := vLastProjectTargetName
      else
        vLastProjectTargetName := path;
      path := IncludeTrailingPathDelimiter(ExtractFilePath(path));
    end
    else
      Exit;
  end
  else
  begin
    path := ExtractFilePath(ParamStr(0));
    path := IncludeTrailingPathDelimiter(path);
  end;
  if Pos(path, S) = 1 then
    Delete(Result, 1, Length(path));
end;

procedure QueryPerformanceCounter(out val: Int64);
begin
  Winapi.Windows.QueryPerformanceCounter(val);
end;

function QueryPerformanceFrequency(out val: Int64): Boolean;
begin
  Result := Boolean(Winapi.Windows.QueryPerformanceFrequency(val));
end;

function StartPrecisionTimer: Int64;
begin
  QueryPerformanceCounter(Result);
end;

function PrecisionTimerLap(const precisionTimer: Int64): Double;
begin
  // we can do this, because we don't really stop anything
  Result := StopPrecisionTimer(precisionTimer);
end;

function StopPrecisionTimer(const precisionTimer: Int64): Double;
var
  cur, freq: Int64;
begin
  QueryPerformanceCounter(cur);
  if not vInvPerformanceCounterFrequencyReady then
  begin
    QueryPerformanceFrequency(freq);
    vInvPerformanceCounterFrequency := 1.0 / freq;
    vInvPerformanceCounterFrequencyReady := True;
  end;
  Result := (cur - precisionTimer) * vInvPerformanceCounterFrequency;
end;

var
  vSStartTime: TDateTime;
  vLastTime: TDateTime;
  vDeltaMilliSecond: TDateTime;

function AppTime: Double;
var
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  with SystemTime do
    Result := (wHour * (MinsPerHour * SecsPerMin * MSecsPerSec) + wMinute *
      (SecsPerMin * MSecsPerSec) + wSecond * MSecsPerSec + wMilliSeconds) -
      vSStartTime;
  // Hack to fix time precession
  if Result - vLastTime = 0 then
  begin
    Result := Result + vDeltaMilliSecond;
    vDeltaMilliSecond := vDeltaMilliSecond + 0.1;
  end
  else
  begin
    vLastTime := Result;
    vDeltaMilliSecond := 0.1;
  end;
end;

function FindUnitName(anObject: TObject): string;
begin
  if Assigned(anObject) then
    Result := anObject.UnitName
  else
    Result := '';
end;

function FindUnitName(aClass: TClass): string;
begin
  if Assigned(aClass) then
    Result := aClass.UnitName
  else
    Result := '';
end;

procedure SetExeDirectory;
var
  path: string;
begin
  if IsDesignTime then
  begin
    if Assigned(vProjectTargetName) then
    begin
      path := vProjectTargetName();
      if Length(path) = 0 then
        path := vLastProjectTargetName
      else
        vLastProjectTargetName := path;
      path := IncludeTrailingPathDelimiter(ExtractFilePath(path));
      SetCurrentDir(path);
    end;
  end
  else
  begin
    path := ExtractFilePath(ParamStr(0));
    path := IncludeTrailingPathDelimiter(path);
    SetCurrentDir(path);
  end;
end;

function GetValueFromStringsIndex(const AStrings: TStrings;
  const AIndex: Integer): string;
begin
  Result := AStrings.ValueFromIndex[AIndex];
end;

function IsDirectoryWriteable(const AName: string): Boolean;
var
  LFileName: String;
  LHandle: THandle;
begin
  LFileName := IncludeTrailingPathDelimiter(AName) + 'chk.tmp';
  LHandle := CreateFile(PChar(LFileName), GENERIC_READ or GENERIC_WRITE, 0, nil,
    CREATE_NEW, FILE_ATTRIBUTE_TEMPORARY or FILE_FLAG_DELETE_ON_CLOSE, 0);
  Result := LHandle <> INVALID_HANDLE_VALUE;
  if Result then
    CloseHandle(LHandle);
end;

function CharToWideChar(const AChar: AnsiChar): WideChar;
var
  lResult: PWideChar;
begin
  GetMem(lResult, 2);
  MultiByteToWideChar(CP_ACP, 0, @AChar, 1, lResult, 2);
  Result := lResult^;
  FreeMem(lResult, 2);
end;

function HalfToFloat(Half: THalfFloat): Single;
var
  Dst, Sign, Mantissa: LongWord;
  Exp: LongInt;
begin
  // extract sign, exponent, and mantissa from half number
  Sign := Half shr 15;
  Exp := (Half and $7C00) shr 10;
  Mantissa := Half and 1023;
  if (Exp > 0) and (Exp < 31) then
  begin
    // common normalized number
    Exp := Exp + (127 - 15);
    Mantissa := Mantissa shl 13;
    Dst := (Sign shl 31) or (LongWord(Exp) shl 23) or Mantissa;
    // Result := Power(-1, Sign) * Power(2, Exp - 15) * (1 + Mantissa / 1024);
  end
  else if (Exp = 0) and (Mantissa = 0) then
  begin
    // zero - preserve sign
    Dst := Sign shl 31;
  end
  else if (Exp = 0) and (Mantissa <> 0) then
  begin
    // denormalized number - renormalize it
    while (Mantissa and $00000400) = 0 do
    begin
      Mantissa := Mantissa shl 1;
      Dec(Exp);
    end;
    Inc(Exp);
    Mantissa := Mantissa and not $00000400;
    // now assemble normalized number
    Exp := Exp + (127 - 15);
    Mantissa := Mantissa shl 13;
    Dst := (Sign shl 31) or (LongWord(Exp) shl 23) or Mantissa;
    // Result := Power(-1, Sign) * Power(2, -14) * (Mantissa / 1024);
  end
  else if (Exp = 31) and (Mantissa = 0) then
  begin
    // +/- infinity
    Dst := (Sign shl 31) or $7F800000;
  end
  else // if (Exp = 31) and (Mantisa <> 0) then
  begin
    // not a number - preserve sign and mantissa
    Dst := (Sign shl 31) or $7F800000 or (Mantissa shl 13);
  end;
  // reinterpret LongWord as Single
  Result := PSingle(@Dst)^;
end;

function FloatToHalf(Float: Single): THalfFloat;
var
  Src: LongWord;
  Sign, Exp, Mantissa: LongInt;
begin
  Src := PLongWord(@Float)^;
  // extract sign, exponent, and mantissa from Single number
  Sign := Src shr 31;
  Exp := LongInt((Src and $7F800000) shr 23) - 127 + 15;
  Mantissa := Src and $007FFFFF;
  if (Exp > 0) and (Exp < 30) then
  begin
    // simple case - round the significand and combine it with the sign and exponent
    Result := (Sign shl 15) or (Exp shl 10) or ((Mantissa + $00001000) shr 13);
  end
  else if Src = 0 then
  begin
    // input float is zero - return zero
    Result := 0;
  end
  else
  begin
    // difficult case - lengthy conversion
    if Exp <= 0 then
    begin
      if Exp < -10 then
      begin
        // input float's value is less than HalfMin, return zero
        Result := 0;
      end
      else
      begin
        // Float is a normalized Single whose magnitude is less than HalfNormMin.
        // We convert it to denormalized half.
        Mantissa := (Mantissa or $00800000) shr (1 - Exp);
        // round to nearest
        if (Mantissa and $00001000) > 0 then
          Mantissa := Mantissa + $00002000;
        // assemble Sign and Mantissa (Exp is zero to get denotmalized number)
        Result := (Sign shl 15) or (Mantissa shr 13);
      end;
    end
    else if Exp = 255 - 127 + 15 then
    begin
      if Mantissa = 0 then
      begin
        // input float is infinity, create infinity half with original sign
        Result := (Sign shl 15) or $7C00;
      end
      else
      begin
        // input float is NaN, create half NaN with original sign and mantissa
        Result := (Sign shl 15) or $7C00 or (Mantissa shr 13);
      end;
    end
    else
    begin
      // Exp is > 0 so input float is normalized Single
      // round to nearest
      if (Mantissa and $00001000) > 0 then
      begin
        Mantissa := Mantissa + $00002000;
        if (Mantissa and $00800000) > 0 then
        begin
          Mantissa := 0;
          Exp := Exp + 1;
        end;
      end;
      if Exp > 30 then
      begin
        // exponent overflow - return infinity half
        Result := (Sign shl 15) or $7C00;
      end
      else
        // assemble normalized half
        Result := (Sign shl 15) or (Exp shl 10) or (Mantissa shr 13);
    end;
  end;
end;

// By PAL, added to fix problem with decimal separator in non En configurations
function GLStrToFloatDef(const S: string; const Default: Extended;
  fs: TFormatSettings): Extended; overload;
begin
  fs.DecimalSeparator := '.';
  if not TextToFloat(S, Result, fs) then
    Result := Default;
end;

// By PAL, added to fix problem with decimal separator in non En configurations
function GLStrToFloatDef(const S: string; const Default: Extended)
  : Extended; overload;
var
  fs: TFormatSettings;
begin
  fs.DecimalSeparator := '.';
  if not TextToFloat(S, Result, fs) then
    Result := Default;
end;

// By PAL, added to fix problem with decimal separator in non En configurations
function GLStrToFloatDef(const S: string): Extended; overload;
var
  fs: TFormatSettings;
begin
  fs.DecimalSeparator := '.';
  if not TextToFloat(S, Result, fs) then
    Result := 0;
end;

// ==========================================================================

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

procedure ScreenUV(x, y: double; X0, Y0: integer; Scale: double;
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
      ScreenUV(x, y, X0, Y0, Scale, u, v); // Перевод в экранные коорд.
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
      ScreenUV(x, y, X0, Y0, Scale, u, v);
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
    ScreenUV(x, y, X0, Y0, Scale, u, v);
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
      ScreenUV(x, y, X0, Y0, Scale, u, v);
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
  Color: TGSColorVector; // Star color
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
      ScreenUV(x, y, CX, CY, SC, u, v); // Перевод в экранные координаты
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


// ----------------------------------------
initialization
// ----------------------------------------
vSStartTime := AppTime;

end.
