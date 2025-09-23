//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("..\source\astroc\fcForm.cpp", FormC);
USEFORM("..\source\astroc\fcAstroScene.cpp", frmAstroScene);
USEFORM("..\source\astroc\dcImages.cpp", dmImages);
USEFORM("..\source\astroc\dcDialogs.cpp", dmDialogs);
USEFORM("..\source\astroc\dcBase.cpp", dmBase);

//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TfrmAstroScene), &frmAstroScene);
		Application->CreateForm(__classid(TdmImages), &dmImages);
		Application->CreateForm(__classid(TdmDialogs), &dmDialogs);
		Application->CreateForm(__classid(TdmBase), &dmBase);
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
