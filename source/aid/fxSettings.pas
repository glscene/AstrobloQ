unit fxSettings;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Layouts,
  FMX.TreeView,
  FMX.TabControl;

type
  TFormSettings = class(TForm)
    TreeViewSettings: TTreeView;
    tvGeneral: TTreeViewItem;
    tvInterface: TTreeViewItem;
    tvDisplay: TTreeViewItem;
    tvPlanets: TTreeViewItem;
    tvStars: TTreeViewItem;
    tvGalaxy: TTreeViewItem;
    TabControlGeneral: TTabControl;
    TabItemGeneral: TTabItem;
    TabItemInterface: TTabItem;
    TabItemDisplay: TTabItem;
    TabItemPlanets: TTabItem;
    TabItemStars: TTabItem;
    TabItemGalaxy: TTabItem;
    Lang: TLang;
  private
  public
  end;

var
  FormSettings: TFormSettings;

implementation

{$R *.fmx}

end.
