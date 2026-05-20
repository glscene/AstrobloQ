//---------------------------------------------------------------------------

#include <vcl.h>
#include <typeinfo>
#include <fstream>

#pragma hdrstop

#include "fcStarCube_ru.h"
#include "fcTableStars_ru.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormTableStars *FormTableStars;
int TablesCount;
String DBname, TableName;
//---------------------------------------------------------------------------
__fastcall TFormTableStars::TFormTableStars(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

