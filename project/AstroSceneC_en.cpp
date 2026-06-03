//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\source\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("..\source\dcBase.cpp", dmBase); /* TDataModule: File Type */
USEFORM("..\source\astro\en\fcOptions_en.cpp", FormOptions);
USEFORM("..\source\fcFormFirst.cpp", FormFirst);
USEFORM("..\source\astro\en\fcAbout_en.cpp", frmAbout);
USEFORM("..\source\dcImages.cpp", dmImages); /* TDataModule: File Type */
USEFORM("..\source\astro\en\fcHipparcos_en.cpp", frmHipparcos);
USEFORM("..\source\astro\en\fcHercRussel_en.cpp", frmHercRussel);
USEFORM("..\source\astro\en\fcAstroScene_en.cpp", FormAstroScene);
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
