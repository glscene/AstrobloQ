//---------------------------------------------------------------------------

#include <fmx.h>
#pragma hdrstop

#include "fcxEarthMars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.fmx"
TfrmEarthMars *frmEarthMars;
//---------------------------------------------------------------------------
__fastcall TfrmEarthMars::TfrmEarthMars(TComponent* Owner)
	: TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TfrmEarthMars::SphereEarthClick(TObject *Sender)
{
   if (SphereEarth->Position->Z > -1) {
//	  SphereEarth->Position->Z = -2;
	 TAnimator::AnimateFloat(SphereEarth, "Position.Z", -2);
   }  else {
//	  SphereEarth->Position->Z = 0;
	 TAnimator::AnimateFloat(SphereEarth, "Position.Z", 0);
   }
}
//---------------------------------------------------------------------------
void __fastcall TfrmEarthMars::Viewport3D1MouseDown(TObject *Sender, TMouseButton Button,
          TShiftState Shift, float X, float Y)
{
   FDown = PointF(X, Y);
}
//---------------------------------------------------------------------------
void __fastcall TfrmEarthMars::Viewport3D1MouseMove(TObject *Sender, TShiftState Shift, float X,
		  float Y)
{
   if (Shift.Contains(ssLeft)) {
	 DummyXY->RotationAngle->X = DummyXY->RotationAngle->X - ((Y - FDown.Y) * 0.3);
	 DummyXY->RotationAngle->Y = DummyXY->RotationAngle->Y - ((X - FDown.X) * 0.3);
	 FDown = PointF(X, Y);
   }
}
//---------------------------------------------------------------------------
void __fastcall TfrmEarthMars::Viewport3D1MouseWheel(TObject *Sender, TShiftState Shift,
          int WheelDelta, bool &Handled)
{
   const float ZOOM_STEP = 2;
   const float CAMERA_MAX_Z = -2;
   const float CAMERA_MIN_Z = -102;
   float newZ;



   if (WheelDelta > 0) {
	  newZ = CameraZ->Position->Z + ZOOM_STEP;
   } else {
	  newZ = CameraZ->Position->Z - ZOOM_STEP;
   }

   if ((newZ < CAMERA_MAX_Z) && (newZ > CAMERA_MIN_Z)) {
      CameraZ->Position->Z = newZ;
   }
}
//---------------------------------------------------------------------------
