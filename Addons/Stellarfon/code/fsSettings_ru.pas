unit fsSettings_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.MMSystem,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IniFiles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,

  fsFirstForm_ru;


type
  PNoteRec = ^TNoteRec;
  TNoteRec = record
    FName: string;
    LName: string;
  end;


type
  TfrmSettings = class(TfrmFirst)
    tvSettings: TTreeView;
    PageControl: TPageControl;
    tsGeneral: TTabSheet;
    tsInterface: TTabSheet;
    tsConstellations: TTabSheet;
    tsColorwheels: TTabSheet;
    tsSounds: TTabSheet;
    PanelBottom: TPanel;
    ButtonOk: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    grpDeviceSetup: TGroupBox;
    lblMidiOutDevice: TLabel;
    cmbMidiOutDev: TComboBox;
    grpTrainExamSettings: TGroupBox;
    lblStage: TLabel;
    lblSimpleNotes: TLabel;
    lblIntervals: TLabel;
    cmbStage: TComboBox;
    btnAdd: TBitBtn;
    btnDel: TBitBtn;
    btnBigOctave: TCheckBox;
    btnSmallOctave: TCheckBox;
    btnFirstOctave: TCheckBox;
    btnSecondOctave: TCheckBox;
    pgcMode: TPageControl;
    tabSimpleNotes: TTabSheet;
    chkWhiteNotes: TCheckBox;
    chkBlackNotes: TCheckBox;
    tabIntervals: TTabSheet;
    chkInt0: TCheckBox;
    chkInt1: TCheckBox;
    chkInt2: TCheckBox;
    chkInt3: TCheckBox;
    chkInt4: TCheckBox;
    chkInt5: TCheckBox;
    chkInt6: TCheckBox;
    chkInt7: TCheckBox;
    chkInt8: TCheckBox;
    chkInt9: TCheckBox;
    chkInt10: TCheckBox;
    chkInt11: TCheckBox;
    chkInt12: TCheckBox;
    chkIntMore8: TCheckBox;
    chkIntMore16: TCheckBox;
    chkIntUp: TCheckBox;
    chkIntDown: TCheckBox;
    chkIntHarm: TCheckBox;
    chkIntFromWhite: TCheckBox;
    chkIntFromBlack: TCheckBox;
    chkIntFromC1: TCheckBox;
    trkModeRatio: TTrackBar;
    Label1: TLabel;
    tabMode: TTabControl;
    btnRepeat: TBitBtn;
    btnNext: TBitBtn;
    grpStatistics: TGroupBox;
    lblPlayed: TLabel;
    lblCorrect: TLabel;
    lblRatio: TLabel;
    edtStagePlayed: TEdit;
    edtTotalPlayed: TEdit;
    edtStageCorrect: TEdit;
    edtTotalCorrect: TEdit;
    edtStageRatio: TEdit;
    edtTotalRatio: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    btnReset: TBitBtn;
    ComboBox1: TComboBox;
    GroupBoxMIDIdevice: TGroupBox;
    chbReleaseMIDIOutput: TCheckBox;
    procedure Button1Click(Sender: TObject); ///?
    procedure Button2Click(Sender: TObject); ///?
    procedure Button3Click(Sender: TObject); ///?
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonOkClick(Sender: TObject);
    procedure tvSettingsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chbReleaseMIDIOutputClick(Sender: TObject);
  private
    NoteRecPtr: PNoteRec;
    TreeViewIndex: LongInt;
  public
    CurLangID : Word;
    procedure ReadIniFile; override;
    procedure WriteIniFile;
  end;

function MidiSuccess(Res: MMResult): Boolean;
procedure OpenMidiDevice;
procedure CloseMidiDevice;

var
  frmSettings: TfrmSettings;
  MidiOutDev: DWord = MIDI_MAPPER;
  hMidiOut: THandle = 1;


implementation  //=============================================================

{$R *.dfm}

function MidiSuccess(Res: MMResult): Boolean;
var
  P: PChar;
begin
  Result := (Res = MMSYSERR_NOERROR);
  if not Result then
  begin
    GetMem(P, 1024);
    midiOutGetErrorText(Res, P, 1024);
    MessageBox(0, P, 'MIDI Error', MB_OK or MB_ICONERROR or MB_TASKMODAL);
    FreeMem(P)
  end
end;

// -------------------- Открыть МИДИ устройство ------------------------------
procedure OpenMidiDevice;
begin
  if MidiSuccess(midiOutOpen(@hMidiOut, MidiOutDev, 0, 0, CALLBACK_NULL)) then
    midiOutReset(hMidiOut)
  else
  begin
    frmSettings.chbReleaseMIDIOutput.Checked := True;
    hMidiOut := 0
  end
end;

// -------------------- Закрыть МИДИ устройство ------------------------------
procedure CloseMidiDevice;
begin
  if hMidiOut <> 0 then
  begin
    MidiSuccess(midiOutClose(hMidiOut));
    hMidiOut := 0
  end
end;


(*
Assuming these types are used, the following code adds a
node to TreeView1 as the last sibling of the selected node.
A TNoteRec record is associated with the added item.
The FName and LName fields are obtained from edit boxes
    Edit1 and Edit2.
*)
//----------------------- Показать форму -----------------------------------
procedure TfrmSettings.FormShow(Sender: TObject);
var
  I: Integer;
  Caps: TMIDIOUTCAPS;

begin
  inherited;
  ReadIniFile;
  New(NoteRecPtr);

  // подключение MIDI клавиатуры
  for i := -1 to midiOutGetNumDevs-1 do
  begin
//   midiOutGetDevCaps(i, @Caps, SizeOf(Caps));  // range check error
    cmbMidiOutDev.Items.Add(Caps.szPname)
  end;
  cmbMidiOutDev.ItemIndex := 0;

  //
  for I := 0 to tvSettings.Items.Count - 1 do
  begin
    tvSettings.Items[I].ImageIndex := 0;
    tvSettings.Items[I].SelectedIndex := 1;
    tvSettings.Items[I].StateIndex := I;
  end;
  tvSettings.Items[0].Text := 'General';
  tvSettings.Items[1].Text := 'Interface';
  tvSettings.Items[2].Text := 'Constellations';
  tvSettings.Items[3].Text := 'Colorwheels';
  tvSettings.Items[4].Text := 'Sounds';

  tvSettings.Select(tvSettings.Items[0]);
  tvSettings.Items[0].DropHighlighted := True;
  tvSettings.FullExpand;

  OpenMidiDevice;
end;


//--------------------------------------------------------------------------
procedure TfrmSettings.Button1Click(Sender: TObject);
var
  I : Integer;
begin
  inherited;
(*
  for I := 0 to (TreeView1.Selected.Count - 1) do
    ListBox1.Items.Add(TreeView1.Selected.Item[I].Text);
*)
  NoteRecPtr^.FName := Edit1.Text;
  NoteRecPtr^.LName := Edit2.Text;

  TreeViewIndex := tvSettings.Selected.AbsoluteIndex;
  if tvSettings.Items.Count = 0 then
    tvSettings.Items.AddObject(nil, 'Item' + IntToStr(TreeViewIndex), NoteRecPtr)
  else if (TreeViewIndex < tvSettings.Items.Count) and (TreeViewIndex >= 0) then
//    TreeView1.Items.AddObject(TreeView1.Items[TreeViewIndex],
//    'Item' + IntToStr(TreeViewIndex), MyRecPtr);
    tvSettings.Items.AddObject(tvSettings.Items[TreeViewIndex], Edit1.Text, nil);
    tvSettings.Items.AddObject(tvSettings.Items[TreeViewIndex], Edit2.Text, nil);

end;

(*
После добавления TNoteRec в item следующий код retrieves FName и LName,
связанные с этим item и имена показываются в label.
*)
procedure TfrmSettings.Button2Click(Sender: TObject);
begin
  inherited;
  if (tvSettings.Selected.Data <> nil) then // Query only works on new nodes.
    Edit3.Text := PNoteRec(tvSettings.Selected.Data)^.FName + ' ' +
                  PNoteRec(tvSettings.Selected.Data)^.LName;
end;

//--------------------------------------------------------------------------
procedure TfrmSettings.Button3Click(Sender: TObject);
begin
  inherited;
  Edit4.Text := IntToStr(tvSettings.Selected.AbsoluteIndex);
end;


//--------------------------------------------------------------------------
procedure TfrmSettings.tvSettingsClick(Sender: TObject);
begin
  inherited;
  tvSettings.Items[1].DropHighlighted := False;
  case tvSettings.Selected.StateIndex of
     0: PageControl.ActivePage := tsGeneral;
     1: PageControl.ActivePage := tsInterface;
     2: PageControl.ActivePage := tsConstellations;
     3: PageControl.ActivePage := tsColorwheels;
     4: PageControl.ActivePage := tsSounds;
  end;
end;

procedure TfrmSettings.FormDestroy(Sender: TObject);
begin
  inherited;
  Dispose(NoteRecPtr);
end;

//----------------------------------------------------------------------
procedure TfrmSettings.ReadIniFile;
var
  IniFile: TIniFile;
begin
  inherited;
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    // LanguageID := IniFile.ReadInteger(FormSettings.Name, rgLanguage.Name, 0);
  finally
    IniFile.Free;
  end;
end;

procedure TfrmSettings.WriteIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
//    IniFile.WriteInteger(FormSettings.Name, btnBigOctava, ...);
  finally
    IniFile.Free;
  end;
  inherited;
end;

//----------------------------------------------------------------
procedure TfrmSettings.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  WriteIniFile;
  inherited;
end;

//----------------------------------------------------------------
procedure TfrmSettings.ButtonOkClick(Sender: TObject);
var
  FileName: TFileName;
begin
  inherited;
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if FileExists(UpperCase(FileName)) then
    DeleteFile(UpperCase(FileName)); //to avoid duplication of sections
  Close;
 //
end;

procedure TfrmSettings.chbReleaseMIDIOutputClick(Sender: TObject);
begin
  if chbReleaseMIDIOutput.Checked then
    CloseMidiDevice
  else
    OpenMidiDevice;
end;

end.
