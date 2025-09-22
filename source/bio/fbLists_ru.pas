unit fbLists_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Contnrs,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.ToolWin,
  Bio.Reality,
  Bio.Satellites;

type
  TfrmLists = class(TForm)
    Panel15: TPanel;
    Panel7: TPanel;
    panCultureName: TPanel;
    lbThings: TListBox;
    Panel3: TPanel;
    btnDelete: TBitBtn;
    Panel20: TPanel;
    Panel1: TPanel;
    btnView: TBitBtn;
    Splitter2: TSplitter;
    btnTrack: TBitBtn;
    ToolBar1: TToolBar;
    tbExistents: TToolButton;
    tbAttachments: TToolButton;
    tbReferences: TToolButton;
    tbGrids: TToolButton;
    tbCradle: TToolButton;
    tbPurgatory: TToolButton;
    tbThings: TToolButton;
    tbSpace: TToolButton;
    tbEnvironment: TToolButton;
    tbReality: TToolButton;
    redView: TRichEdit;
    Panel2: TPanel;
    btnClose: TBitBtn;
    tbEventRound: TToolButton;
    tbEventQueue: TToolButton;
    btnRefreshAll: TBitBtn;
    cbAutoRefresh: TCheckBox;
    cbPlants: TCheckBox;
    cbCreatures: TCheckBox;
    cbClouds: TCheckBox;
    tbFruits: TToolButton;
    tbPrey: TToolButton;
    tbPredators: TToolButton;
    tb3DView: TToolButton;
    tbColliders: TToolButton;
    tbTrash: TToolButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshAllClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnViewClick(Sender: TObject);
    procedure lbThingsDblClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnTrackClick(Sender: TObject);
    procedure tbExistentsClick(Sender: TObject);
    procedure tbGridsClick(Sender: TObject);
    procedure tbAttachmentsClick(Sender: TObject);
    procedure tbReferencesClick(Sender: TObject);
    procedure tbCradleClick(Sender: TObject);
    procedure tbPurgatoryClick(Sender: TObject);
    procedure tbFormsClick(Sender: TObject);
    procedure tbThingsClick(Sender: TObject);
    procedure tbSpaceClick(Sender: TObject);
    procedure tbEnvironmentClick(Sender: TObject);
    procedure tbEventRoundClick(Sender: TObject);
    procedure tbEventQueueClick(Sender: TObject);
    procedure tbRealityClick(Sender: TObject);
    procedure tbFruitsClick(Sender: TObject);
    procedure tbPreyClick(Sender: TObject);
    procedure tbPredatorsClick(Sender: TObject);
    procedure tb3DViewClick(Sender: TObject);
    procedure tbCollidersClick(Sender: TObject);
    procedure tbTrashClick(Sender: TObject);
  private
     
    fReality: AIReality;
  public
     
    property Reality: AIReality read fReality write fReality;

    procedure RefreshAll;
    procedure RefreshThings;
    procedure RefreshGrids;

    procedure Advance;

    procedure EditSatellite(aSatellite: AISatellite);
  end;

var
  frmLists: TfrmLists;

implementation //=============================================================

{$R *.DFM}

uses
  fbImages_ru,
  fbFirstForm_ru,
  fbSatellite_ru,
  Bio.Things,
  Bio.Trees,
  Bio.Space,
  Bio.Grid,
  Bio.Creature,
  Bio.Weather,
  Bio.EvolvingTrees;

procedure TfrmLists.Advance;
begin
  if cbAutoRefresh.Checked then
    RefreshAll;
end;

procedure TfrmLists.RefreshAll;
begin
  RefreshThings;
end;

procedure TfrmLists.RefreshThings;
var
  myIndex: integer;
  myThing: AIThing;
  myLastPos: integer;
begin
  myLastPos := lbThings.ItemIndex;

  LockWindowUpdate(lbThings.Handle);

  lbThings.Clear;
  lbThings.Sorted := false;

  for myIndex := 0 to Reality.Environment.Things.Existents.Count -1 do
  begin
    myThing := AIThing(Reality.Environment.Things.Existents[myIndex]);

    if not ((myThing is AIPlant) or (myThing is AIEvolvingPlant)) or cbPlants.Checked then
    if not (myThing is AICreature) or cbCreatures.Checked then
    if not (myThing is AICloud) or cbClouds.Checked then
    lbThings.Items.AddObject(
      myThing.OneLineDisplay,
      myThing);
  end;

  lbThings.ItemIndex := lbThings.Items.Count - 1;

  lbThings.ItemIndex := myLastPos;

  LockWindowUpdate(0);
end;

procedure TfrmLists.RefreshGrids;
var
  X: integer;
  Y: integer;
  myGrid: AIGrid;
begin
  redView.Clear;
  for X := 0 to Reality.Environment.Space.WidthLoop do
    for Y := 0 to Reality.Environment.Space.HeightLoop do
  begin
    myGrid := AIGrid(Reality.Environment.Space.Map[X][Y]);
    redView.Lines.Add(myGrid.OneLineDisplay);
  end;
end;

procedure TfrmLists.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := false;
  frmFirst.RealityForm.ManagerForm.DropLists;
end;

procedure TfrmLists.FormShow(Sender: TObject);
begin
  RefreshThings;
end;

procedure TfrmLists.btnRefreshAllClick(Sender: TObject);
begin
  RefreshThings;
end;

procedure TfrmLists.EditSatellite(aSatellite: AISatellite);
var
  myFormSatellite: TFormSatellite;
begin
  myFormSatellite := TFormSatellite.Create(self);
  myFormSatellite.Satellite := aSatellite;
  myFormSatellite.Show;
end;

procedure TfrmLists.btnDeleteClick(Sender: TObject);
var
  myThing: AIThing;
begin
  if not (lbThings.ItemIndex = -1) then
  begin
    myThing := AIThing(lbThings.Items.Objects[lbThings.ItemIndex]);
    myThing.Cease;
  end;
end;

procedure TfrmLists.btnViewClick(Sender: TObject);
var
  myThing: AIThing;
begin
  if not (lbThings.ItemIndex = -1) then
  begin
    myThing := AIThing(lbThings.Items.Objects[lbThings.ItemIndex]);
    frmFirst.RealityForm.ManagerForm.SpiritWindows.AddSpirit(myThing, true);
  end;
end;

procedure TfrmLists.lbThingsDblClick(Sender: TObject);
var
  myThing: AIThing;
begin
  if not (lbThings.ItemIndex = -1) then
  begin
    myThing := AIThing(lbThings.Items.Objects[lbThings.ItemIndex]);
    frmFirst.RealityForm.ManagerForm.SpiritWindows.AddSpirit(myThing, true);
  end;
end;

procedure TfrmLists.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLists.btnTrackClick(Sender: TObject);
var
  myThing: AIThing;
begin
  if not (lbThings.ItemIndex = -1) then
  begin
    myThing := AIThing(lbThings.Items.Objects[lbThings.ItemIndex]);
    frmFirst.RealityForm.ManagerForm.SpaceForm.FindTarget(myThing);
  end;
end;

procedure TfrmLists.tbExistentsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Existents.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbGridsClick(Sender: TObject);
begin
  RefreshGrids;
end;

procedure TfrmLists.tbAttachmentsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Attachments.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbReferencesClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.References.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbCradleClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Cradle.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbPurgatoryClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Purgatory.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbFormsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Forms.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbThingsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbSpaceClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Space.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbEnvironmentClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbEventRoundClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Space.EventRound.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbEventQueueClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Space.EventQueue.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbRealityClick(Sender: TObject);
begin
  redView.Clear;
  Reality.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbFruitsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Fruits.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbPreyClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Prey.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbPredatorsClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Predators.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tb3DViewClick(Sender: TObject);
begin
  redView.Clear;
  frmFirst.RealityForm.ManagerForm.SpaceForm.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbCollidersClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Colliders.FullDisplay(redView.Lines);
end;

procedure TfrmLists.tbTrashClick(Sender: TObject);
begin
  redView.Clear;
  Reality.Environment.Things.Trash.FullDisplay(redView.Lines);
end;

end.
