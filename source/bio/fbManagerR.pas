unit fbManagerR;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  System.Math,
  System.Contnrs,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  ToolWin,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.Menus,

  fbImagesR,
  fbEventsR,
  fbListsR,
  fbSpiritR,
  vInterfaceClasses,
  fbBiosferaR,
  vSpiritManagerR,
  fbPopulationsR,
  fbHeightFieldR,
  fbHumidityMapR;

type
  TFormManager = class(TForm)
    Panel3: TPanel;
    Panel2: TPanel;
    panSpirits: TPanel;
    Panel1: TPanel;
    tbSpirits: TToolBar;
    ToolBar1: TToolBar;
    tbEvents: TToolButton;
    tbLists: TToolButton;
    tbSpace: TToolButton;
    tbTime: TToolButton;
    tbConstruction: TToolButton;
    tbPopulations: TToolButton;
    tbHeightField: TToolButton;
    tbHumidityMap: TToolButton;
    Panel4: TPanel;
    btnAddThing: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbEventsClick(Sender: TObject);
    procedure tbListsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure tbSpaceClick(Sender: TObject);
    procedure tbTimeClick(Sender: TObject);
    procedure tbConstructionClick(Sender: TObject);
    procedure tbPopulationsClick(Sender: TObject);
    procedure tbHeightFieldClick(Sender: TObject);
    procedure tbHumidityMapClick(Sender: TObject);
    procedure btnAddThingClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FSpiritWindows: TSpiritList;
    FSpaceForm: TFormBiosfera;
    FEventsForm: TFormEvents;
    FListsForm: TfmLists;
    FPopulations: TFormPopulations;
    FHeightField: TFormHeightField;
    FHumidityMap: TFormHumidityMap;
    FStarted: boolean;
  public
    property SpaceForm: TFormBiosfera read FSpaceForm;
    property EventsForm: TFormEvents read FEventsForm;
    property ListsForm: TfmLists read FListsForm;
    property SpiritWindows: TSpiritList read FSpiritWindows;
    property Populations: TFormPopulations read FPopulations;
    property HeightField: TFormHeightField read FHeightField;
    property HumidityMap: TFormHumidityMap read FHumidityMap;
    procedure Advance;
    procedure RefreshSpirits;
    procedure PopSpace;
    procedure DropSpace;
    procedure PopLists;
    procedure DropLists;
    procedure PopEvents;
    procedure DropEvents;
    procedure PopConstruction;
    procedure DropConstruction;
    procedure PopPopulations;
    procedure DropPopulations;
    procedure PopHeightField;
    procedure DropHeightField;
    procedure PopHumidityMap;
    procedure DropHumidityMap;
    procedure BigHide;
    procedure BigRestore;
    procedure DropAll;
    procedure Reset;
    procedure Verify;
    function FocusForm: TForm;
  end;

var
  FormManager: TFormManager;

implementation //-------------------------------------------------------------

uses
  fbRealityR,
  fbFirstFormR,
  fbConstructionR,
  Bio.Globals;

{$R *.DFM}

procedure TFormManager.FormCreate(Sender: TObject);
begin
  FStarted := false;

  frmFirst.Construction.AddEvent('Создание fEventsForm...');
  FEventsForm := TFormEvents.Create(self);

  frmFirst.Construction.AddEvent('Создание SpiritList...');
  FSpiritWindows := TSpiritList.Create(self, tbSpirits);

  frmFirst.Construction.AddEvent('Создание f3DEnvironment...');
  FSpaceForm := TFormBiosfera.Create(self);
end;

procedure TFormManager.FormDestroy(Sender: TObject);
begin
  DropAll;

  fEventsForm.Free;
  fSpiritWindows.Free;
  if Assigned(fListsForm) then
    fListsForm.Free;
  // free populations graph
  if Assigned(fPopulations) then
    fPopulations.Free;
  // free heat map
  if Assigned(fHeightField) then
  begin
    fHeightField.GLSceneViewer.Camera := nil;
    fHeightField.GLScene.CurrentGLCamera.DeleteChildren;
    fHeightField.Free;
  end;
  // free humidity map
  if Assigned(fHumidityMap) then
  begin
    fHumidityMap.GLSceneViewer.Camera := nil;
    fHumidityMap.GLScene.CurrentGLCamera.DeleteChildren;
    fHumidityMap.Free;
  end;
  fSpaceForm.Free;
end;

procedure TFormManager.Advance;
begin
  if SpiritWindows.Count <> 0 then
    SpiritWindows.AdvanceAll;

  if tbLists.Down then
    ListsForm.Advance;

  if tbSpace.Down then
    SpaceForm.Advance
  else
    SpaceForm.AdvanceHidden;

  if Assigned(Populations) then
    Populations.Advance;

  if tbHeightField.Down then
    HeightField.Advance;

  if tbHumidityMap.Down then
    HumidityMap.Advance;
end;

procedure TFormManager.DropAll;
begin
  DropSpace;
  DropEvents;
  DropLists;
  DropPopulations;
  DropHeightField;
  DropHumidityMap;
end;

procedure TFormManager.BigHide;
begin
  SpaceForm.Hide;
  EventsForm.Hide;
  FormImages.Hide;
  SpiritWindows.HideAll;
  if Assigned(fListsForm) then
    ListsForm.Hide;
  if Assigned(fPopulations) then
    Populations.Hide;
  if Assigned(fHeightField) then
    HeightField.Hide;
  if Assigned(fHumidityMap) then
    HumidityMap.Hide;
end;

procedure TFormManager.BigRestore;
begin
  Show;

  if tbSpace.Down then
    PopSpace;
  if tbEvents.Down then
    PopEvents;
  if tbLists.Down then
    PopLists;
  if tbPopulations.Down then
    PopPopulations;
  if tbHeightField.Down then
    PopHeightField;
  if tbHumidityMap.Down then
    PopHumidityMap;
end;

procedure TFormManager.RefreshSpirits;
var
  i: integer;
begin
  for i := 0 to SpiritWindows.Count - 1 do
    TSpiritHolder(SpiritWindows.Items[i]).SpiritForm.RefreshAll;
end;

procedure TFormManager.PopSpace;
begin
  if not SpaceForm.Visible then
    SpaceForm.RefreshPlanetFull;
    
  tbSpace.Down := true;
  SpaceForm.Show;
  SpaceForm.GLCadencer.Enabled := true;
end;

procedure TFormManager.DropSpace;
begin
  tbSpace.Down := false;
  SpaceForm.Visible := false;
  SpaceForm.EmptyAllSounds;
  SpaceForm.GLCadencer.Enabled := false;
end;

procedure TFormManager.PopEvents;
begin
  tbEvents.Down := true;
  EventsForm.Show;
end;

procedure TFormManager.DropEvents;
begin
  tbEvents.Down := false;
  EventsForm.Visible := false;
end;

procedure TFormManager.PopLists;
var
  myMonitor: integer;
begin
  if not Assigned(fListsForm) then
  begin
    frmFirst.Construction.AddEvent('Создание fListForm...');
    fListsForm := TfmLists.Create(self);
    fListsForm.Reality := gReality;
  end;

  tbLists.Down := true;
  ListsForm.Show;

  myMonitor := frmFirst.Monitors - 1;  // last monitor

  ListsForm.Left := frmFirst.Screen.Monitors[myMonitor].Left;
  ListsForm.Top := frmFirst.Screen.Monitors[myMonitor].Top;
end;

procedure TFormManager.DropLists;
begin
  tbLists.Down := false;
  if Assigned(fListsForm) then
    ListsForm.Visible := false;
end;

procedure TFormManager.PopConstruction;
begin
  tbConstruction.Down := true;
  frmFirst.Construction.Show;
end;

procedure TFormManager.DropConstruction;
begin
  tbConstruction.Down := false;
  frmFirst.Construction.Visible := false;
end;

procedure TFormManager.tbEventsClick(Sender: TObject);
begin
  if tbEvents.Down then
    PopEvents
  else
    DropEvents;
end;

procedure TFormManager.tbListsClick(Sender: TObject);
begin
  if tbLists.Down then
    PopLists
  else
    DropLists;
end;

procedure TFormManager.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := false;
end;

procedure TFormManager.FormShow(Sender: TObject);
begin
  panSpirits.Left := panSpirits.Left + 1;

  if frmFirst.UserSettings.RememberView then
  begin
    if frmFirst.UserSettings.ViewAligned then
    begin
      SpaceForm.Align := alClient;
      SpaceForm.tbStickyFit.Down := true;
    end
    else
    begin
      SpaceForm.Align := alNone;
      SpaceForm.tbStickyFit.Down := false;
      SpaceForm.Width := frmFirst.UserSettings.ViewSizeX;
      SpaceForm.Height := frmFirst.UserSettings.ViewSizeY;
    end;
  end;

  SpaceForm.Top := Top;
  SpaceForm.Left := Left + Width;
  SpaceForm.Left := SpaceForm.Left + 1;
  SpaceForm.Left := SpaceForm.Left - 1;
  SpaceForm.Height := SpaceForm.Height + 1;
  SpaceForm.Height := SpaceForm.Height - 1;

  if not fStarted and frmFirst.UserSettings.TipOfTheDay then
    frmFirst.RealityForm.ShowTipOfTheDay;
  fStarted := true;
end;

procedure TFormManager.tbSpaceClick(Sender: TObject);
begin
  if tbSpace.Down then
    PopSpace
  else
    DropSpace;
end;

procedure TFormManager.tbTimeClick(Sender: TObject);
begin
  tbTime.Down := true;
  frmFirst.RealityForm.Show;
end;

procedure TFormManager.tbConstructionClick(Sender: TObject);
begin
  if tbConstruction.Down then
    PopConstruction
  else
    DropConstruction;
end;

procedure TFormManager.PopPopulations;
begin
  if not Assigned(fPopulations) then
  begin
    frmFirst.Construction.AddEvent('Создание Populations...');
    fPopulations := TFormPopulations.Create(self);
  end;

  tbPopulations.Down := true;
  Populations.Show;
end;

procedure TFormManager.DropPopulations;
begin
  if Assigned(fPopulations) then
    Populations.Hide;
  tbPopulations.Down := false;
end;

procedure TFormManager.tbPopulationsClick(Sender: TObject);
begin
  if tbPopulations.Down then
    PopPopulations
  else
    DropPopulations;
end;

procedure TFormManager.PopHeightField;
begin
  if not Assigned(FHeightField) then
  begin
    frmFirst.Construction.AddEvent('Создание Height Field...');
    FHeightField := TFormHeightField.Create(self);
  end;

  tbHeightField.Down := true;
  HeightField.Show;
end;

procedure TFormManager.DropHeightField;
begin
  tbHeightField.Down := false;
  if Assigned(FHeightField) then
  begin
    HeightField.Visible := false;
//    FHeightField.Free;
//    FHeightField := nil;
  end;
end;

procedure TFormManager.tbHeightFieldClick(Sender: TObject);
begin
  if tbHeightField.Down then
    PopHeightField
  else
    DropHeightField;
end;

procedure TFormManager.PopHumidityMap;
begin
  if not Assigned(fHumidityMap) then
  begin
    frmFirst.Construction.AddEvent('Создание Humidity Map...');
    fHumidityMap := TFormHumidityMap.Create(self);
  end;

  tbHumidityMap.Down := true;
  HumidityMap.Show;
end;

procedure TFormManager.DropHumidityMap;
begin
  tbHumidityMap.Down := false;
  if Assigned(fHumidityMap) then
  begin
    HumidityMap.Visible := false;
//    fHumidityMap.Free;
//    fHumidityMap := nil;
  end;
end;

procedure TFormManager.tbHumidityMapClick(Sender: TObject);
begin
  if tbHumidityMap.Down then
    PopHumidityMap
  else
    DropHumidityMap;
end;

procedure TFormManager.Reset;
begin
  DropAll;
  if Assigned(fPopulations) then
  begin
    fPopulations.Free;
    fPopulations := nil;
  end;
end;

procedure TFormManager.btnAddThingClick(Sender: TObject);
begin
  fSpaceForm.PopUpTargetWindow;
end;

procedure TFormManager.FormActivate(Sender: TObject);
begin
//  Verify;
//  Show;
//  SetFocus;
end;

procedure TFormManager.Verify;
begin
  frmFirst.RealityForm.Show;
  BigRestore;
end;

function TFormManager.FocusForm: TForm;
begin
  result := self;
  if SpaceForm.Focused then
    result := SpaceForm;
  if EventsForm.Focused then
    result := EventsForm;
  if Assigned(ListsForm) and ListsForm.Focused then
    result := ListsForm;
  if Assigned(Populations) and Populations.Focused then
    result := Populations;
  if Assigned(HeightField) and HeightField.Focused then
    result := HeightField;
  if Assigned(HumidityMap) and HumidityMap.Focused then
    result := HumidityMap;
end;

end.
