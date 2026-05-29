//---------------------------------------------------------------------------

#pragma hdrstop

#include "Astro.Utils.c"
#include <stdio.h>
#include <ctype.h>


//---------------------------------------------------------------------------
#pragma package(smart_init)

/*
TFileName GetAstrobloQPath();
{
  TFileName Path
  int N;
  Path = LowerCase(ExtractFilePath(ParamStr(0)));
  N = Pos('AstrobloQ', Path);
  Delete(Path, N, Length(path));
  Path = IncludeTrailingPathDelimiter(Path);
  SetCurrentDir(Path);
  Result = Path;
}

*/


