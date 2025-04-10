//---------------------------------------------------------------------------

#ifndef fcGeobloqH
#define fcGeobloqH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Forms3D.hpp>
#include <FMX.Controls3D.hpp>
#include <FMX.Types.hpp>
#include <System.Math.Vectors.hpp>
#include <FMX.Objects3D.hpp>
//---------------------------------------------------------------------------
class TfrmGeobloq : public TForm3D
{
__published:	// IDE-managed Components
	TCamera *Camera1;
	TCube *Cube1;
private:	// User declarations
public:		// User declarations
	__fastcall TfrmGeobloq(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmGeobloq *frmGeobloq;
//---------------------------------------------------------------------------
#endif
