//---------------------------------------------------------------------------

#ifndef fcVolumeRenderH
#define fcVolumeRenderH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Controls.Presentation.hpp>
#include <FMX.Controls3D.hpp>
#include <FMX.Memo.hpp>
#include <FMX.Memo.Types.hpp>
#include <FMX.Objects3D.hpp>
#include <FMX.ScrollBox.hpp>
#include <FMX.TabControl.hpp>
#include <FMX.Types.hpp>
#include <FMX.Types3D.hpp>
#include <FMX.Viewport3D.hpp>
#include <System.Math.Vectors.hpp>
//---------------------------------------------------------------------------
class TFormTexture3D : public TForm
{
__published:	// IDE-managed Components
	TTabControl *TabControl1;
	TTabItem *TabItemV;
	TViewport3D *Viewport3D1;
	TGrid3D *Grid3D1;
	TLight *Light1;
	TDummy *Dummy1;
	TDummy *Dummy2;
	TCamera *Camera1;
	TStrokeCube *StrokeCube1;
	TTabItem *TabItemS;
	TTabControl *TabControlS;
	TTabItem *TabItemSV;
	TTabControl *TabControlSV;
	TTabItem *TabItemSVC;
	TMemo *MemoSVC;
	TTabItem *TabItemSVE;
	TMemo *MemoSVE;
	TTabItem *TabItemSP;
	TTabControl *TabControlSP;
	TTabItem *TabItemSPC;
	TMemo *MemoSPC;
	TTabItem *TabItemSPE;
	TMemo *MemoSPE;
private:	// User declarations
public:		// User declarations
	__fastcall TFormTexture3D(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormTexture3D *FormTexture3D;
//---------------------------------------------------------------------------
#endif
