//---------------------------------------------------------------------------

#pragma hdrstop

#include "ucUtils.h"
#include <stdio.h>
#include <ctype.h>


//---------------------------------------------------------------------------
#pragma package(smart_init)

/*
TFileName GetAssetsPath();
{
  TFileName Path
  int N;
  Path = LowerCase(ExtractFilePath(ParamStr(0)));
  N = Pos('bin', Path);
  Delete(Path, N, Length(path));
  Path = IncludeTrailingPathDelimiter(Path) + 'assets\\';
  SetCurrentDir(Path);
  Result = Path;
}

*/


/*
TFileName GetDataPath();
{
  TFileName Path;
  int N;
  Path = LowerCase(ExtractFilePath(ParamStr(0)));
  N = Pos('bin', Path);
  Delete(Path, N, Length(path));
  Path = IncludeTrailingPathDelimiter(Path) + 'data\\';
  SetCurrentDir(Path);
  Result = Path;
}

*/
