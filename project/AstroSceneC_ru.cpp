//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\source\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("..\source\dcBase.cpp", dmBase); /* TDataModule: File Type */
USEFORM("..\source\astro\ru\fcOptions_ru.cpp", FormOptions);
USEFORM("..\source\fcFormFirst.cpp", FormFirst);
USEFORM("..\source\astro\ru\fcAbout_ru.cpp", frmAbout);
USEFORM("..\source\dcImages.cpp", dmImages); /* TDataModule: File Type */
USEFORM("..\source\astro\ru\fcHipparcos_ru.cpp", frmHipparcos);
USEFORM("..\source\astro\ru\fcHercRussel_ru.cpp", frmHercRussel);
USEFORM("..\source\astro\ru\fcAstroScene_ru.cpp", FormAstroScene);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFormAstroScene), &FormAstroScene);
		Application->CreateForm(__classid(TdmImages), &dmImages);
		Application->CreateForm(__classid(TdmDialogs), &dmDialogs);
		Application->CreateForm(__classid(TdmBase), &dmBase);
		Application->CreateForm(__classid(TFormOptions), &FormOptions);
		Application->CreateForm(__classid(TFormFirst), &FormFirst);
		Application->CreateForm(__classid(TfrmHercRussel), &frmHercRussel);
		Application->CreateForm(__classid(TfrmHipparcos), &frmHipparcos);
		Application->Run();
	}
	catch (Exception &exception)
	{
		Application->ShowException(&exception);
	}
	catch (...)
	{
		try
		{
			throw Exception("");
		}
		catch (Exception &exception)
		{
			Application->ShowException(&exception);
		}
	}
	return 0;
}
//---------------------------------------------------------------------------
