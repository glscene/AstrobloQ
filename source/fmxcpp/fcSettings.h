//---------------------------------------------------------------------------

#ifndef fcSettingsH
#define fcSettingsH
//---------------------------------------------------------------------------
#include <System.Classes.hpp>
#include <FMX.Controls.hpp>
#include <FMX.Forms.hpp>
#include <FMX.Layouts.hpp>
#include <FMX.TreeView.hpp>
#include <FMX.Types.hpp>
#include <FMX.TabControl.hpp>
#include "gnuGettext.hpp"

//---------------------------------------------------------------------------
class TFormSettings : public TForm
{
__published:	// IDE-managed Components
	TTabControl *TabControlGeneral;
	TTabItem *TabItemGeneral;
	TTabItem *TabItemInterface;
	TTabItem *TabItemDisplay;
	TTabItem *TabItemPlanets;
	TTabItem *TabItemStars;
	TTabItem *TabItemGalaxy;
	TTreeView *TreeViewSettings;
	TTreeViewItem *tvGeneral;
	TTreeViewItem *tvInterface;
	TTreeViewItem *tvDisplay;
	TTreeViewItem *tvPlanets;
	TTreeViewItem *tvStars;
	TTreeViewItem *tvGalaxy;
private:	// User declarations
public:		// User declarations
	__fastcall TFormSettings(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormSettings *FormSettings;
//---------------------------------------------------------------------------
#endif
