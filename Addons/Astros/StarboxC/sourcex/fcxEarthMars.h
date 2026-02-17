//---------------------------------------------------------------------------

#ifndef fcxEarthMarsH
#define fcxEarthMarsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls3D.hpp>
#include <FMX.MaterialSources.hpp>
#include <FMX.Objects3D.hpp>
#include <FMX.Types.hpp>
#include <FMX.Viewport3D.hpp>
#include <System.Math.Vectors.hpp>
#include <FMX.Ani.hpp>
//---------------------------------------------------------------------------
class TfrmEarthMars : public TForm
{
__published:	// IDE-managed Components
	TViewport3D *Viewport3D1;
	TDummy *DummyScene;
	TSphere *SphereEarth;
	TSphere *SphereMars;
	TTextureMaterialSource *TextureMaterialSourceEarth;
	TTextureMaterialSource *TextureMaterialSourceMars;
	TFloatAnimation *FloatAnimationSphereEarthRotAngleY;
	TDummy *DummyXY;
	TCamera *CameraZ;
	void __fastcall SphereEarthClick(TObject *Sender);
	void __fastcall Viewport3D1MouseDown(TObject *Sender, TMouseButton Button, TShiftState Shift,
          float X, float Y);
	void __fastcall Viewport3D1MouseMove(TObject *Sender, TShiftState Shift, float X,
          float Y);
	void __fastcall Viewport3D1MouseWheel(TObject *Sender, TShiftState Shift, int WheelDelta,
		  bool &Handled);
private:	// User declarations
  TPointF FDown;
public:		// User declarations
	__fastcall TfrmEarthMars(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TfrmEarthMars *frmEarthMars;
//---------------------------------------------------------------------------
#endif
