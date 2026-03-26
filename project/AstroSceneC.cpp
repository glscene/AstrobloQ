//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\Source\astroc\fcHipparcos.cpp", frmHipparcos);
USEFORM("..\Source\astroc\fcHercRussel.cpp", frmHercRussel);
USEFORM("..\source\astroc\fcForm.cpp", FormC);
USEFORM("..\Source\astroc\fcSettings.cpp", FormSettings);
USEFORM("..\source\astroc\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("..\source\astroc\dcBase.cpp", dmBase); /* TDataModule: File Type */
USEFORM("..\source\astroc\fcAstroScene.cpp", FormAstroScene);
USEFORM("..\Source\astroc\fcAbout.cpp", frmAbout);
USEFORM("..\source\astroc\dcImages.cpp", dmImages); /* TDataModule: File Type */
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
		Application->CreateForm(__classid(TFormSettings), &FormSettings);
		Application->CreateForm(__classid(TFormC), &FormC);
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
