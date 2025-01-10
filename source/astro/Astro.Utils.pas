//
// The graphics engine GLScene
//
unit Astro.Utils;

(* Miscellaneous support utilities & classes *)

interface


uses
  Winapi.Windows,
  Winapi.ShellApi,
  System.Classes,
  System.SysUtils,
  System.UITypes,
  Stage.VectorGeometry,
  Stage.Strings;

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

// Get current path to assets from dir examples
function GetAssetsPath(): TFileName;
function GetDataPath(): TFileName;


implementation //--------------------------------------------------------------

var
  vLastProjectTargetName: string;

function GetAssetsPath(): TFileName;
var
  Path: TFileName;
  N: Integer;
begin
  Path := LowerCase(ExtractFilePath(ParamStr(0)));
//  N := Pos('addons', Path);
  N := Pos('astrobloq', Path);
  Delete(Path, N, Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'astrobloq/assets';
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
  Delete(Path, N, Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'astrobloq/data';
  SetCurrentDir(Path);
  Result := Path;
end;


initialization  // -----------------------------------------------------------


end.
