//---------------------------------------------------------------------------

#ifndef dcDialogsH
#define dcDialogsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.ExtDlgs.hpp>
//---------------------------------------------------------------------------
class TdmDialogs : public TDataModule
{
__published:	// IDE-managed Components
	TSavePictureDialog *SavePictureDialog;
	TOpenPictureDialog *OpenPictureDialog;
	TSaveTextFileDialog *SaveTextFileDialog;
	TOpenTextFileDialog *OpenTextFileDialog;
	TSaveDialog *SaveDialog;
	TOpenDialog *OpenDialog;
private:	// User declarations
public:		// User declarations
	__fastcall TdmDialogs(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TdmDialogs *dmDialogs;
//---------------------------------------------------------------------------
#endif
