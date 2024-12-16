//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("source\cpp\fcHipparcos.cpp", FormHipparcos);
USEFORM("source\cpp\fcHercRussel.cpp", FormHercRussel);
USEFORM("source\cpp\fcForm.cpp", FormC);
USEFORM("source\cpp\fcAstroViewer.cpp", FormAstroviewer);
USEFORM("source\cpp\fcSettings.cpp", FormSettings);
USEFORM("source\cpp\fcAbout.cpp", FormAbout);
USEFORM("source\cpp\dcImages.cpp", dmImages); /* TDataModule: File Type */
USEFORM("source\cpp\dcDialogs.cpp", dmDialogs); /* TDataModule: File Type */
USEFORM("source\cpp\dcBase.cpp", dmBase); /* TDataModule: File Type */
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFormAstroviewer), &FormAstroviewer);
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
