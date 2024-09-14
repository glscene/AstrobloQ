unit fxStarCells;

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
  System.Math.Vectors,
  FMX.Types3D,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,
  FMX.Objects3D,
  FMX.Controls3D,
  FMX.Viewport3D,
  FMX.TabControl;

type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItemV: TTabItem;
    Viewport3D1: TViewport3D;
    Grid3D1: TGrid3D;
    Light1: TLight;
    Dummy1: TDummy;
    Dummy2: TDummy;
    Camera1: TCamera;
    StrokeCube1: TStrokeCube;
    Dummy3: TDummy;
    RoundCube1: TRoundCube;
    Timer1: TTimer;
    TabItemS: TTabItem;
    TabControlS: TTabControl;
    TabItemSV: TTabItem;
    TabControlSV: TTabControl;
    TabItemSVC: TTabItem;
    MemoSVC: TMemo;
    TabItemSVE: TTabItem;
    MemoSVE: TMemo;
    TabItemSP: TTabItem;
    TabControlSP: TTabControl;
    TabItemSPC: TTabItem;
    MemoSPC: TMemo;
    TabItemSPE: TTabItem;
    MemoSPE: TMemo;
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
