unit fbReality_ru;

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
  Vcl.Menus,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ToolWin,
  Vcl.ImgList,

  Bio.Reality,
  fbManager_ru,
  fbMiniForm_ru,

  Space.Globals;

// geTipofDay

const
  cInstructionExit = 0;
  cInstructionLoadFile = 1;

type
  TFormReality = class(TMiniForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Quit1: TMenuItem;
    Run1: TMenuItem;
    Add1: TMenuItem;
    menuGo: TMenuItem;
    menuStop: TMenuItem;
    Set1: TMenuItem;
    TimeMode1: TMenuItem;
    menuSetTimeTicking: TMenuItem;
    menuSetTimeFlowing: TMenuItem;
    Object1: TMenuItem;
    AI1: TMenuItem;
    Apple1: TMenuItem;
    Orange1: TMenuItem;
    Panel2: TPanel;
    Panel4: TPanel;
    btnGo: TBitBtn;
    btnStop: TBitBtn;
    Panel16: TPanel;
    radTicking: TRadioButton;
    radFlowing: TRadioButton;
    menuMonitor: TMenuItem;
    menuMonitorSingle: TMenuItem;
    menuMonitorDouble: TMenuItem;
    View1: TMenuItem;
    Net1: TMenuItem;
    AllowInterNetTravel1: TMenuItem;
    AllowCommunication1: TMenuItem;
    menuEnvironmentName: TMenuItem;
    Names1: TMenuItem;
    menuSave: TMenuItem;
    menuCreatorName: TMenuItem;
    About1: TMenuItem;
    About2: TMenuItem;
    Panel1: TPanel;
    Panel17: TPanel;
    laBspeed: TLabel;
    Label1: TLabel;
    trackSpeed: TTrackBar;
    Panel3: TPanel;
    panRealityT: TPanel;
    panRealityTime: TPanel;
    panRealityTime1: TPanel;
    Load1: TMenuItem;
    SaveAs1: TMenuItem;
    menuNewReality: TMenuItem;
    menuReadme: TMenuItem;
    RealityClock: TTimer;
    menuViewManager: TMenuItem;
    menuViewSpace: TMenuItem;
    menuViewEvents: TMenuItem;
    menuViewLists: TMenuItem;
    menuTutorial: TMenuItem;
    odLoadReality: TOpenDialog;
    sdSaveReality: TSaveDialog;
    menuKeyboard: TMenuItem;
    menuMax: TMenuItem;
    menuSettings: TMenuItem;
    labRoundTime: TLabel;
    Panel5: TPanel;
    btnExit: TBitBtn;
    ime1: TMenuItem;
    Construction1: TMenuItem;
    Restore1: TMenuItem;
    ipoftheDay1: TMenuItem;
    ReloadDNA1: TMenuItem;
    btn20: TBitBtn;
    cbCollisions: TCheckBox;
    cbAI: TCheckBox;
    AAsteroids1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure menuSetTimeTickingClick(Sender: TObject);
    procedure menuSetTimeFlowingClick(Sender: TObject);
    procedure btnGoClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure radTickingClick(Sender: TObject);
    procedure radFlowingClick(Sender: TObject);
    procedure menuMonitorSingleClick(Sender: TObject);
    procedure menuMonitorDoubleClick(Sender: TObject);
    procedure menuGoClick(Sender: TObject);
    procedure menuStopClick(Sender: TObject);
    procedure trackSpeedChange(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure menuEnvironmentNameClick(Sender: TObject);
    procedure menuCreatorNameClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure About2Click(Sender: TObject);
    procedure menuReadmeClick(Sender: TObject);
    procedure RealityClockTimer(Sender: TObject);
    procedure menuViewManagerClick(Sender: TObject);
    procedure menuViewSpaceClick(Sender: TObject);
    procedure menuViewEventsClick(Sender: TObject);
    procedure menuViewListsClick(Sender: TObject);
    procedure Load1Click(Sender: TObject);
    procedure menuSaveClick(Sender: TObject);
    procedure menuNewRealityClick(Sender: TObject);
    procedure SaveAs1Click(Sender: TObject);
    procedure menuTutorialClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure menuKeyboardClick(Sender: TObject);
    procedure menuMaxClick(Sender: TObject);
    procedure menuSettingsClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure ipoftheDay1Click(Sender: TObject);
    procedure ReloadDNA1Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure cbCollisionsClick(Sender: TObject);
    procedure cbAIClick(Sender: TObject);
    procedure AAsteroids1Click(Sender: TObject);
  private
    FReality: AIReality;
    FManagerForm: TFormManager;
    FPaused: Boolean;
    FFileName: string;
    FExitInstruction: integer;
    procedure MyMinimize(Sender: TObject; var state: TMiniState);
    procedure MyMaximize(Sender: TObject; var state: TMiniState);
  public
    property Reality: AIReality read FReality;
    property ManagerForm: TFormManager read FManagerForm;
    property Paused: Boolean read FPaused write FPaused;
    property FileName: string read FFileName write FFileName;
    property ExitInstruction: integer read FExitInstruction write FExitInstruction;
    procedure RefreshAll;
    procedure RefreshInterface;
    procedure RefreshTickers;
    procedure StartReality;
    procedure StopReality;
    procedure Advance;
    procedure VerifyWindows;
    function SaveRealityToFile(aFileName: string): Boolean;
    procedure AddEvent(aEvent: string);
    procedure StartUp(aFileName: string);
    procedure ShutDown;
    procedure FlipOnOffSwitch; // switches the reality on/off
    procedure ShowTipOfTheDay;
  end;

var
  FormReality: TFormReality;

implementation // --------------------------------------------------

uses
  Bio.Things,
  Bio.Space,
  Bio.Utilities,

  fbSpirit_ru,
  fbEditLine_ru,
  fbImages_ru,
  fbFirstForm_ru,
  fbAbout_ru,
  fbIntro_ru,
  fbNewReality_ru,
  fbTutorial_ru,
  fbKeyboard_ru,
  fbMaximums_ru,
  fbTip_ru,
  fbSettings_ru
  ;

{$R *.DFM}

// -----------------------------------------------------------------------------
// --------------------------- FORM LOGIC --------------------------------------
// -----------------------------------------------------------------------------
procedure TFormReality.FormCreate(Sender: TObject);
begin
  OnMinimize := MyMinimize;
  OnMaximize := MyMaximize;
  fExitInstruction := cInstructionExit;
  if frmFirst.UserSettings.TipOfTheDay then
    RealityClock.Enabled := false;
  inherited;
end;

// -----------------------------------------------------------------------------
procedure TFormReality.RefreshInterface;
begin
  RealityClock.Interval := Reality.ClockStagger;
  trackSpeed.Position := Reality.ClockStagger;

  btnGo.Enabled := not RealityClock.Enabled;
  btnStop.Enabled := RealityClock.Enabled;

  menuSetTimeTicking.Checked := Reality.TimeIsTicking;
  menuSetTimeFlowing.Checked := Reality.TimeIsFlowing;
  radTicking.Checked := Reality.TimeIsTicking;
  radFlowing.Checked := Reality.TimeIsFlowing;

  menuSetTimeTicking.Enabled := not RealityClock.Enabled;
  menuSetTimeFlowing.Enabled := not RealityClock.Enabled;
  radTicking.Enabled := not RealityClock.Enabled;
  radFlowing.Enabled := not RealityClock.Enabled;

  labRoundTime.Caption := IntToStr(RealityClock.Interval) + ' ms';

  if RealityClock.Enabled then
    Application.Title := 'Biosfera (Go)'
  else
    Application.Title := 'Biosfera (Stop)';

  cbCollisions.Checked := Reality.Environment.Things.Collisions;
  cbAI.Checked := Reality.Environment.Things.AI;
  cbCollisions.Visible := frmFirst.UserSettings.AdvancedMode;
  cbAI.Visible := frmFirst.UserSettings.AdvancedMode;

  RefreshTickers;
end;

procedure TFormReality.RefreshAll;
begin
  RefreshInterface;
  ManagerForm.Advance;
end;

procedure TFormReality.FormShow(Sender: TObject);
begin
  if frmFirst.UserSettings.TipOfTheDay then
    RealityClock.Enabled := true;
  frmFirst.Construction.AddEvent('Running');
  RefreshAll;
  Align := alTop;
  ManagerForm.Show;
  ManagerForm.PopSpace;
  if (ManagerForm.SpaceForm.Width >= 1024) or (ManagerForm.SpaceForm.Height >= 728) then
  begin
    ManagerForm.SpaceForm.UnStickyFit;
    ManagerForm.SpaceForm.Width := 1024;
    ManagerForm.SpaceForm.Height := 728;
  end;
  frmFirst.Construction.AddEvent('Still running');
end;

procedure TFormReality.menuSetTimeTickingClick(Sender: TObject);
begin
  Reality.SetTimeTicking;
  RefreshInterface;
end;

procedure TFormReality.menuSetTimeFlowingClick(Sender: TObject);
begin
  Reality.SetTimeFlowing;
  RefreshInterface;
end;

procedure TFormReality.btnGoClick(Sender: TObject);
begin
  StartReality;
  RefreshInterface;
  if ManagerForm.SpaceForm.Visible then
    ManagerForm.SpaceForm.SetFocus;
end;

procedure TFormReality.btnStopClick(Sender: TObject);
begin
  StopReality;
  RefreshInterface;
  if ManagerForm.SpaceForm.Visible then
    ManagerForm.SpaceForm.SetFocus;
end;

procedure TFormReality.StartReality;
begin
  if Reality.TimeIsFlowing then
  begin
    frmFirst.Construction.AddEvent('Started time flowing');
    AddEvent(Reality.Creator + ' started time flowing');
    RealityClock.Enabled := true;
    ManagerForm.SpaceForm.InformOfStart;
  end
  else
  begin
    frmFirst.Construction.AddEvent('Ticked time');
    AddEvent(Reality.Creator + ' ticked time');
    Advance;
  end;
  RefreshAll;
end;

procedure TFormReality.StopReality;
begin
  RealityClock.Enabled := false;
  ManagerForm.SpaceForm.InformOfStop;

  AddEvent(Reality.Creator + ' stopped time');
  frmFirst.Construction.AddEvent('Stopped time');

  RefreshAll;
end;

procedure TFormReality.radTickingClick(Sender: TObject);
begin
  Reality.SetTimeTicking;
  RefreshInterface;
end;

procedure TFormReality.radFlowingClick(Sender: TObject);
begin
  Reality.SetTimeFlowing;
  RefreshInterface;
end;

procedure TFormReality.menuMonitorSingleClick(Sender: TObject);
begin
  // MultipleMonitors := false;
  RefreshInterface;
end;

procedure TFormReality.menuMonitorDoubleClick(Sender: TObject);
begin
  // MultipleMonitors := true;
  RefreshInterface;
end;

procedure TFormReality.menuGoClick(Sender: TObject);
begin
  btnGoClick(Sender);
end;

procedure TFormReality.menuStopClick(Sender: TObject);
begin
  btnStopClick(Sender);
end;

procedure TFormReality.trackSpeedChange(Sender: TObject);
begin
  Reality.ClockStagger := trackSpeed.Position;
  RefreshInterface;
end;

procedure TFormReality.Quit1Click(Sender: TObject);
begin
  StopReality;
  Close;
end;

procedure TFormReality.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Reality.IsRunning then
    StopReality;
  CanClose := true;
end;

procedure TFormReality.menuEnvironmentNameClick(Sender: TObject);
var
  FormEditLine: TFormEditLine;
begin
  FormEditLine := TFormEditLine.Create(self);
  FormEditLine.edLine.Text := Reality.Environment.Name;
  if FormEditLine.ShowModal = mrOK then
    Reality.Environment.Name := FormEditLine.edLine.Text;
  FormEditLine.Free;
  ManagerForm.SpaceForm.Caption := Reality.Environment.Name;
  RefreshAll;
end;

procedure TFormReality.menuCreatorNameClick(Sender: TObject);
var
  FormEditLine: TFormEditLine;
begin
  FormEditLine := TFormEditLine.Create(self);
  FormEditLine.edLine.Text := Reality.Creator;
  if FormEditLine.ShowModal = mrOK then
    Reality.Creator := FormEditLine.edLine.Text;
  FormEditLine.Free;
  RefreshAll;
end;

procedure TFormReality.AddEvent(aEvent: string);
begin
  ManagerForm.EventsForm.AddEvent(aEvent);
end;

procedure TFormReality.About2Click(Sender: TObject);
var
  FormAbout: TFormAbout;
begin
  FormAbout := TFormAbout.Create(self);
  FormAbout.ShowModal;
  FormAbout.Free;
end;

procedure TFormReality.menuReadmeClick(Sender: TObject);
var
  FormIntro: TFormIntro;
begin
  FormIntro := TFormIntro.Create(self);
  FormIntro.Monitors := frmFirst.Monitors;
  FormIntro.ShowModal;
  FormIntro.Free;
end;

procedure TFormReality.MyMinimize(Sender: TObject; var state: TMiniState);
begin
  SetFocus;
  ManagerForm.BigHide;
  ManagerForm.Hide;
  state := tmAll; // minimize all windows
end;

procedure TFormReality.MyMaximize(Sender: TObject; var state: TMiniState);
begin
  Show;
  ManagerForm.Show;
  ManagerForm.BigRestore;
  SetFocus;
end;

procedure TFormReality.Advance;
begin
  // HACK FOR RESTORING FROM MINIMIZED STATE
  if not(WindowState = wsMinimized) and not ManagerForm.Visible then
  begin
    Show;
    ManagerForm.BigRestore;
    SetFocus;
  end;

  Reality.TickTock;
  RefreshTickers;
  ManagerForm.Advance;
end;

procedure TFormReality.RefreshTickers;
begin
  panRealityTime1.Caption := IntToStr(Reality.Time);
end;

procedure TFormReality.RealityClockTimer(Sender: TObject);
begin
  Advance;
end;

procedure TFormReality.menuViewManagerClick(Sender: TObject);
begin
  if not ManagerForm.Visible then
  begin
    ManagerForm.Show;
    ManagerForm.BigRestore;
  end
  else
    ManagerForm.Hide;
end;

procedure TFormReality.menuViewSpaceClick(Sender: TObject);
begin
  ManagerForm.PopSpace;
end;

procedure TFormReality.menuViewEventsClick(Sender: TObject);
begin
  ManagerForm.PopEvents;
end;

procedure TFormReality.menuViewListsClick(Sender: TObject);
begin
  ManagerForm.PopLists;
end;

procedure TFormReality.Load1Click(Sender: TObject);
begin
  odLoadReality.InitialDir := ExtractFilePath(ParamStr(0)) + '\worlds';
  odLoadReality.FileName := '*.air';

  //(* Load new world
  if odLoadReality.Execute then
  begin
//    if Reality.ValidFile(odLoadReality.FileName) then
    begin
      StopReality;
      fFileName := odLoadReality.FileName;
      fExitInstruction := cInstructionLoadFile;
      Close;
    end
//    else
//      ShowMessage(_('Invalid file version'));
  end;
  (**)
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
end;

procedure TFormReality.menuSaveClick(Sender: TObject);
begin
  if SaveRealityToFile(FileName) then
    ShowMessage('Симуляция сохранена ' + FileName)
  else
    ShowMessage('Ошибка сохранения симуляции');
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
end;

function TFormReality.SaveRealityToFile(aFileName: string): Boolean;
var
  myFile: TextFile;
begin
  AssignFile(myFile, aFileName);
  Rewrite(myFile);
  Reality.SaveToFile(myFile);
  frmFirst.UserSettings.WorkingFile := aFileName;
  Writeln(myFile, 'Saved at ' + DateToStr(Now) + ' ' + TimeToStr(Now));
  CloseFile(myFile);
  FileName := aFileName;
  result := true;
end;

procedure TFormReality.menuNewRealityClick(Sender: TObject);
var
  myNewReality: TFormNewReality;
begin
  StopReality;
  myNewReality := TFormNewReality.Create(self);
  if (myNewReality.ShowModal = mrOK) then
  begin
    ManagerForm.DropAll;
    SetCurrentDir(ExtractFilePath(ParamStr(0)));
    Reality.Clean;
    myNewReality.ExtractValues(Reality);
    Reality.SaveReality('new.air');
    fExitInstruction := cInstructionLoadFile;
    fFileName := 'new.air';
    Close;
  end;
  myNewReality.Free;
end;

procedure TFormReality.SaveAs1Click(Sender: TObject);
begin
  sdSaveReality.InitialDir := ExtractFilePath(ParamStr(0)) + '\worlds';
  sdSaveReality.FileName := '*.air';
  if sdSaveReality.Execute then
  begin
    if SaveRealityToFile(sdSaveReality.FileName) then
      ShowMessage('Мир сохранён как ' + FileName)
    else
      ShowMessage('Мир не сохраняется');
  end;
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
end;

//--------------------------------------------------------------------------
// Руководство
//--------------------------------------------------------------------------
procedure TFormReality.menuTutorialClick(Sender: TObject);
var
  myfmTutorial: TFormTutorial;
begin
  myfmTutorial := TFormTutorial.Create(self);
  myfmTutorial.ShowModal;
  myfmTutorial.Free;
end;

procedure TFormReality.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ManagerForm.DropAll;
  if Reality.IsRunning then
    StopReality;
end;

procedure TFormReality.menuKeyboardClick(Sender: TObject);
var
  myFormKeyboard: TFormKeyboard;
begin
  myFormKeyboard := TFormKeyboard.Create(self);
  myFormKeyboard.ShowModal;
  myFormKeyboard.Free;
end;

procedure TFormReality.menuMaxClick(Sender: TObject);
var
  myFormMaximums: TFormMaximums;
begin
  myFormMaximums := TFormMaximums.Create(self);
  myFormMaximums.ShowModal;
  myFormMaximums.Free;
end;

procedure TFormReality.menuSettingsClick(Sender: TObject);
var
  myFormSettings: TFormSettings;
begin
  myFormSettings := TFormSettings.Create(self);
  myFormSettings.UserSettings := frmFirst.UserSettings;
  myFormSettings.ShowModal;
  myFormSettings.Free;
end;

procedure TFormReality.btnExitClick(Sender: TObject);
begin
  StopReality;
  Close;
end;

procedure TFormReality.VerifyWindows;
// var
// myFocus: TForm;
begin
  // make sure all windows are on top
  if not Visible then
    exit;
  if Focused then
    exit;
  // myFocus := ManagerForm.FocusForm;
  // Show;
  ManagerForm.BigRestore;
  // myFocus.SetFocus;
end;

procedure TFormReality.FormActivate(Sender: TObject);
begin
  // ManagerForm.BringToFront;
  // BringToFront;
  // ManagerForm.BigRestore;
end;

procedure TFormReality.StartUp(aFileName: string);
begin
  FReality := AIReality.Create;
  FFileName := 'current.air';
  // try to load a file
  if (aFileName <> '') and FileExists(aFileName) then
  begin
    FFileName := aFileName;
    if Reality.LoadReality(aFileName) then
    begin
      frmFirst.UserSettings.WorkingFile := fFileName;
      frmFirst.UserSettings.SaveToRegistry;
    end;
  end;
  FManagerForm := TFormManager.Create(self);
  ManagerForm.SpaceForm.Environment := Reality.Environment;
  ManagerForm.SpaceForm.BuildGalaxy;
  RefreshInterface;
end;

procedure TFormReality.ShutDown;
begin
  // if autosave on exit, then save
  if frmFirst.UserSettings.AutoSave then
  begin
    frmFirst.UserSettings.WorkingFile := FileName;
    SaveRealityToFile(FileName);
  end;
  FManagerForm.Free;
  FReality.Free;
end;

procedure TFormReality.FlipOnOffSwitch; // switches the reality on/off
begin
  if RealityClock.Enabled then
    StopReality
  else
    StartReality;
end;

procedure TFormReality.Restore1Click(Sender: TObject);
begin
  ManagerForm.SpaceForm.RestoreScene;
end;

procedure TFormReality.ReloadDNA1Click(Sender: TObject);
begin
  Reality.Environment.Things.LoadForms;
  ShowMessage('DNA перезагружена');
end;

procedure TFormReality.btn20Click(Sender: TObject);
begin
  trackSpeed.Position := 40;
  Reality.ClockStagger := trackSpeed.Position;
  RefreshInterface;
end;

procedure TFormReality.cbCollisionsClick(Sender: TObject);
begin
  Reality.Environment.Things.Collisions := cbCollisions.Checked;
  RefreshInterface;
  if cbCollisions.Checked then
    frmFirst.Construction.AddEvent('Включить столкновения')
  else
    frmFirst.Construction.AddEvent('Отключить столкновения');
end;

procedure TFormReality.ipoftheDay1Click(Sender: TObject);
begin
  // StopReality;
  ShowTipOfTheDay;
end;

procedure TFormReality.ShowTipOfTheDay;
var
  myTip: TFormTip;
begin
  myTip := TFormTip.Create(self);
  if ActiveLanguage = LANG_ENGLISH then
    myTip.LoadTipFile(ExtractFilePath(ParamStr(0)) + '\biodata\tips.txt')
  else
    myTip.LoadTipFile(ExtractFilePath(ParamStr(0)) + '\biodata\tips_ru.txt');
  myTip.cbxShowTips.Checked := frmFirst.UserSettings.TipOfTheDay;
  myTip.RandomTip;
  myTip.ShowModal;
  Application.ProcessMessages;
  frmFirst.UserSettings.TipOfTheDay := myTip.cbxShowTips.Checked;
  frmFirst.UserSettings.SaveToRegistry;
  myTip.Free;
end;

procedure TFormReality.cbAIClick(Sender: TObject);
begin
  Reality.Environment.Things.AI := cbAI.Checked;
  RefreshInterface;
  if cbAI.Checked then
    frmFirst.Construction.AddEvent('Включить биосферу')
  else
    frmFirst.Construction.AddEvent('Отключить биосферу');
end;

procedure TFormReality.AAsteroids1Click(Sender: TObject);
var
  myfmEditLine: TFormEditLine;
begin
  myfmEditLine := TFormEditLine.Create(self);
  myfmEditLine.edLine.Text := IntToStr(Reality.Environment.Space.Asteroids);
  if myfmEditLine.ShowModal = mrOK then
    Reality.Environment.Space.Asteroids := StrToInt(myfmEditLine.edLine.Text);
  myfmEditLine.Free;
  ManagerForm.SpaceForm.Caption := Reality.Environment.Name;
  RefreshAll;
end;

end.
