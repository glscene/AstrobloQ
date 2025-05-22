unit fsMidikeys;

// The unit is part of the AstrobloQ

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.MMSystem,

  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Menus,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TFormMidikeys = class(TForm)
    mnuMain: TMainMenu;
    mniFile: TMenuItem;
    mniOptions: TMenuItem;
    miOptions: TMenuItem;
    mniReleaseMIDIOutDev: TMenuItem;
    Exit1: TMenuItem;
    panKeyboard: TPanel;
    btnWhiteC1: TBitBtn;
    btnWhiteD1: TBitBtn;
    btnWhiteE1: TBitBtn;
    btnWhiteF1: TBitBtn;
    btnWhiteG1: TBitBtn;
    btnWhiteA1: TBitBtn;
    btnWhiteH1: TBitBtn;
    btnWhiteC2: TBitBtn;
    btnWhiteD2: TBitBtn;
    btnWhiteE2: TBitBtn;
    btnWhiteF2: TBitBtn;
    btnWhiteG2: TBitBtn;
    btnWhiteA2: TBitBtn;
    btnWhiteH2: TBitBtn;
    btnWhiteC3: TBitBtn;
    btnWhiteD3: TBitBtn;
    btnWhiteE3: TBitBtn;
    btnWhiteF3: TBitBtn;
    btnWhiteG3: TBitBtn;
    btnWhiteA3: TBitBtn;
    btnWhiteH3: TBitBtn;
    btnWhiteC4: TBitBtn;
    btnWhiteD4: TBitBtn;
    btnWhiteE4: TBitBtn;
    btnWhiteF4: TBitBtn;
    btnWhiteG4: TBitBtn;
    btnWhiteA4: TBitBtn;
    btnWhiteH4: TBitBtn;
    btnBlackC1: TBitBtn;
    btnBlackD1: TBitBtn;
    btnBlackF1: TBitBtn;
    btnBlackG1: TBitBtn;
    btnBlackA1: TBitBtn;
    btnBlackC2: TBitBtn;
    btnBlackD2: TBitBtn;
    btnBlackF2: TBitBtn;
    btnBlackG2: TBitBtn;
    btnBlackA2: TBitBtn;
    btnBlackC3: TBitBtn;
    btnBlackD3: TBitBtn;
    btnBlackF3: TBitBtn;
    btnBlackG3: TBitBtn;
    btnBlackA3: TBitBtn;
    btnBlackC4: TBitBtn;
    btnBlackD4: TBitBtn;
    btnBlackF4: TBitBtn;
    btnBlackG4: TBitBtn;
    btnBlackA4: TBitBtn;
    tabMode: TTabControl;
    btnRepeat: TBitBtn;
    btnNext: TBitBtn;
    lblStage: TLabel;
    ComboBox1: TComboBox;
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
    grpSettings: TGroupBox;
    lblInstrum: TLabel;
    cmbInstrum: TComboBox;
    lblVelocity: TLabel;
    trkVelocity: TTrackBar;
    lblVelocityValue: TLabel;
    procedure PaintButtons;
    procedure miOptionsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Exit1Click(Sender: TObject);
    procedure mniReleaseMIDIOutDevClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnWhiteC1Enter(Sender: TObject);
    procedure btnWhiteC1Exit(Sender: TObject);
    procedure btnWhiteC1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnWhiteC1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnWhiteC1Click(Sender: TObject);
    procedure btnWhiteC1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cmbInstrumClick(Sender: TObject);
    procedure trkVelocityChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMidikeys: TFormMidikeys;
  MidiOutDev: DWord = MIDI_MAPPER;
  hMidiOut: THandle = 1;
  KeyboardInFocus: Boolean;
  LastFocused: TObject;
  NowInFocus: TObject;
  Playing: Boolean;
  Instrum: Integer;
  Velocity: Integer = 127;

implementation //-----------------------------------------------------------

uses
  fsSettings;

{$R *.dfm}

var
  S: String;


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

procedure OpenMidiDevice;
begin
  if MidiSuccess(midiOutOpen(@hMidiOut, MidiOutDev, 0, 0, CALLBACK_NULL)) then
    midiOutReset(hMidiOut)
  else
  begin
    FormMidikeys.mniReleaseMIDIOutDev.Checked := True;
    hMidiOut := 0
  end
end;

procedure CloseMidiDevice;
begin
  if hMidiOut <> 0 then
  begin
    MidiSuccess(midiOutClose(hMidiOut));
    hMidiOut := 0
  end
end;

procedure PlayNote(Note: String; Play: Boolean);
var
  M, N: Integer;
begin
  if hMidiOut = 0 then
    Exit;
  if Play then
    M := $90
  else
    M := $80;
  N := Pos(Note[1], 'C D EF G A H') + 24 - 1;
  if Note[2] = '#' then
  begin
    Delete(Note, 2, 1);
    Inc(N)
  end;
  N := N + (Ord(Note[2]) - Ord('0')) * 12;
  midiOutShortMsg(hMidiOut, $C0 + Instrum shl 8);
  midiOutShortMsg(hMidiOut, M + N shl 8 + Velocity shl 16)
end;


//-------------------------------------------------------------------
procedure TFormMidikeys.FormCreate(Sender: TObject);
begin
  cmbInstrum.ItemIndex := 0;
  PaintButtons
end;

//-------------------------------------------------------------------

procedure TFormMidikeys.FormShow(Sender: TObject);
begin
  OpenMidiDevice
end;

procedure TFormMidikeys.PaintButtons;
var
  i: Integer;
begin
  with panKeyboard do
    for i := 0 to ControlCount - 1 do
      if Controls[i] is TBitBtn then
        with (Controls[i] as TBitBtn) do
        begin
          with Glyph do
          begin
            TransparentColor := clFuchsia;
            Width := ClientWidth - 4;
            Height := ClientHeight - 4;
            with Canvas do
              if Copy(Name, 1, 8) = 'btnWhite' then
              begin
                if Name[10] in ['2' .. '3'] then
                  Tag := clWhite
                else
                  Tag := $E0E0E0;
                Brush.Color := Tag;
                FillRect(ClipRect)
              end
              else if Copy(Name, 1, 8) = 'btnBlack' then
              begin
                if Name[10] in ['2' .. '3'] then
                  Tag := clBlack
                else
                  Tag := clMedGray;
                Brush.Color := Tag;
                FillRect(ClipRect)
              end
          end
        end
end;

procedure TFormMidikeys.miOptionsClick(Sender: TObject);
begin
  frmSettings.Show;
{ old
  FormOptions.Show;
  if hMidiOut <> 0 then
    CloseMidiDevice;
  OpenMidiDevice
}
end;

procedure TFormMidikeys.Exit1Click(Sender: TObject);
begin
  Close
end;

procedure TFormMidikeys.mniReleaseMIDIOutDevClick(Sender: TObject);
begin
  if mniReleaseMIDIOutDev.Checked then
    CloseMidiDevice
  else
    OpenMidiDevice
end;

procedure TFormMidikeys.btnWhiteC1Enter(Sender: TObject);
begin
  KeyboardInFocus := True;
  NowInFocus := Sender
end;

procedure TFormMidikeys.btnWhiteC1Exit(Sender: TObject);
begin
  KeyboardInFocus := False;
  LastFocused := Sender
end;

procedure TFormMidikeys.btnWhiteC1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if KeyboardInFocus and (NowInFocus <> Sender) then
  begin
    (Sender as TBitBtn).SetFocus;
    if Playing then
      with (LastFocused as TBitBtn) do
        if Assigned(OnMouseUp) then
          OnMouseUp(LastFocused, mbLeft, [], 0, 0);
    if ssLeft in Shift then
      SendMessage((Sender as TBitBtn).Handle, WM_LBUTTONDOWN, MK_LBUTTON, 0)
  end
end;

procedure TFormMidikeys.btnWhiteC1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  with (Sender as TBitBtn) do
    with Glyph.Canvas do
    begin
      if Tag = clWhite then
        Brush.Color := clYellow
      else
        Brush.Color := $00C0C0;
      FillRect(ClipRect)
    end;
  // Note On
  Playing := True;
  with (Sender as TBitBtn) do
  begin
    S := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', S, 2)
  end;
  PlayNote(S, True)
end;

procedure TFormMidikeys.btnWhiteC1Click(Sender: TObject);
begin
  // Note Play
  with (Sender as TBitBtn) do
  begin
    S := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', S, 2)
  end;
  PlayNote(S, True);
  PlayNote(S, False)
end;

procedure TFormMidikeys.btnWhiteC1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with (Sender as TBitBtn) do
    with Glyph.Canvas do
    begin
      Brush.Color := Tag;
      FillRect(ClipRect)
    end;
  // NoteOff
  Playing := False;
  with (Sender as TBitBtn) do
  begin
    S := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', S, 2)
  end;
  PlayNote(S, False)
end;

procedure TFormMidikeys.cmbInstrumClick(Sender: TObject);
begin
  Instrum := cmbInstrum.ItemIndex
end;

procedure TFormMidikeys.trkVelocityChange(Sender: TObject);
begin
  Velocity := trkVelocity.Position;
  lblVelocityValue.Caption := IntToStr(Velocity)
end;

procedure TFormMidikeys.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CloseMidiDevice
end;

end.
