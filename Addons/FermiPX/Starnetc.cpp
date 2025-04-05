//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("src\fcStarcells.cpp", FormPÑ);
USEFORM("src\fcStarlife.cpp", FormLife);
USEFORM("src\fcAbout.cpp", FormAbout);
USEFORM("src\fcDataset.cpp", FormDataset);
USEFORM("src\fcOptions.cpp", FormOptions);
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
	try
	{
		Application->Initialize();
		Application->MainFormOnTaskBar = true;
		Application->CreateForm(__classid(TFormPÑ), &FormPÑ);
		Application->CreateForm(__classid(TFormOptions), &FormOptions);
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
