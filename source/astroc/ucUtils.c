//---------------------------------------------------------------------------

#pragma hdrstop

#include "ucUtils.h"
#include <stdio.h>
#include <ctype.h>


//---------------------------------------------------------------------------
#pragma package(smart_init)

/*
function GetAssetsPath(): TFileName;
var
  Path: TFileName;
  N: Integer;
begin
  Path := LowerCase(ExtractFilePath(ParamStr(0)));
  N := Pos('bin', Path);
  Delete(Path, N, Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'assets\';
  SetCurrentDir(Path);
  Result := Path;
end;

*/


/*
function GetDataPath(): TFileName;
var
  Path: TFileName;
  N: Integer;
begin
  Path := LowerCase(ExtractFilePath(ParamStr(0)));
  N := Pos('bin', Path);
  Delete(Path, N, Length(path));
  Path := IncludeTrailingPathDelimiter(Path) + 'data\';
  SetCurrentDir(Path);
  Result := Path;
end;

*/
