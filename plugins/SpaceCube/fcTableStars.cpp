//---------------------------------------------------------------------------

#include <vcl.h>
#include <typeinfo>
#include <fstream>

#pragma hdrstop

#include "fcSpaceCube.h"
#include "fcTableStars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TFormTable *FormTable;
int TablesCount;
String DBname, TableName;
//---------------------------------------------------------------------------
__fastcall TFormTable::TFormTable(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------

