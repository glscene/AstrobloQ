//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------------
USEFORM("vclforms\fcStarlife.cpp", FormLife);
USEFORM("vclforms\fcAbout.cpp", FormAbout);
USEFORM("vclforms\fcDataset.cpp", FormDataset);
USEFORM("vclforms\fcOptions.cpp", FormOptions);
USEFORM("vclforms\fcSpace.cpp", FormPÑ);
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
