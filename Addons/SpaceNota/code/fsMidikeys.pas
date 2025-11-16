unit fsMidikeys;

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
  Vcl.ComCtrls,
  Vcl.Imaging.jpeg,

  dmImages,
  fsSettings, Vcl.ColorGrd
  ;

type
  TFormMidikeys = class(TForm)
    PanelLeft: TPanel;
    grpInstruments: TGroupBox;
    PanelKeyboards: TPanel;
    GroupBoxAccordeon: TGroupBox;
    GroupBoxBayan: TGroupBox;
    GroupBoxBayanLK: TGroupBox;
    Panel4: TPanel;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape24: TShape;
    Shape27: TShape;
    Shape37: TShape;
    Shape38: TShape;
    Shape39: TShape;
    Shape40: TShape;
    Shape41: TShape;
    Shape42: TShape;
    Shape43: TShape;
    Shape46: TShape;
    Shape47: TShape;
    Shape48: TShape;
    Panel5: TPanel;
    Shape49: TShape;
    Shape50: TShape;
    Shape51: TShape;
    Shape52: TShape;
    Shape53: TShape;
    Shape54: TShape;
    Shape55: TShape;
    Shape56: TShape;
    Shape57: TShape;
    Shape60: TShape;
    Shape85: TShape;
    Shape86: TShape;
    Shape87: TShape;
    Shape88: TShape;
    Shape89: TShape;
    Shape90: TShape;
    Shape91: TShape;
    Shape94: TShape;
    Shape95: TShape;
    Shape96: TShape;
    Panel6: TPanel;
    Shape97: TShape;
    Shape98: TShape;
    Shape99: TShape;
    Shape100: TShape;
    Shape101: TShape;
    Shape102: TShape;
    Shape103: TShape;
    Shape104: TShape;
    Shape105: TShape;
    Shape107: TShape;
    Shape108: TShape;
    Shape109: TShape;
    Shape110: TShape;
    Shape111: TShape;
    Shape112: TShape;
    Shape113: TShape;
    Shape114: TShape;
    Shape115: TShape;
    Shape118: TShape;
    Shape119: TShape;
    Shape120: TShape;
    Panel7: TPanel;
    Shape121: TShape;
    Shape122: TShape;
    Shape123: TShape;
    Shape124: TShape;
    Shape125: TShape;
    Shape126: TShape;
    Shape127: TShape;
    Shape128: TShape;
    Shape132: TShape;
    Shape147: TShape;
    Shape148: TShape;
    Shape149: TShape;
    Shape150: TShape;
    Shape159: TShape;
    Shape160: TShape;
    Shape161: TShape;
    Shape162: TShape;
    Shape163: TShape;
    Shape166: TShape;
    Shape167: TShape;
    Shape168: TShape;
    Panel8: TPanel;
    Shape169: TShape;
    Shape170: TShape;
    Shape171: TShape;
    Shape172: TShape;
    Shape173: TShape;
    Shape174: TShape;
    Shape175: TShape;
    Shape176: TShape;
    Shape177: TShape;
    Shape179: TShape;
    Shape180: TShape;
    Shape181: TShape;
    Shape182: TShape;
    Shape183: TShape;
    Shape184: TShape;
    Shape185: TShape;
    Shape186: TShape;
    Shape187: TShape;
    Shape190: TShape;
    Shape191: TShape;
    Shape192: TShape;
    Shape45: TShape;
    GroupBoxConstellaton: TGroupBox;
    ImageConstelton: TImage;
    GroupBoxAccordeonRK: TGroupBox;
    cbInstruments: TComboBox;
    trkVelocity: TTrackBar;
    lblVelocity: TLabel;
    lblVelocityValue: TLabel;
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
    GroupBoxBayanRK: TGroupBox;
    Panel1: TPanel;
    Shape129: TShape;
    Shape130: TShape;
    Shape131: TShape;
    Shape133: TShape;
    Shape134: TShape;
    Shape135: TShape;
    Shape136: TShape;
    Shape137: TShape;
    Shape138: TShape;
    Shape141: TShape;
    Shape142: TShape;
    Shape143: TShape;
    Shape144: TShape;
    Shape145: TShape;
    Shape151: TShape;
    Shape153: TShape;
    Shape156: TShape;
    Shape10: TShape;
    Shape106: TShape;
    Panel2: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape28: TShape;
    Shape29: TShape;
    Shape30: TShape;
    Shape31: TShape;
    Shape34: TShape;
    Shape36: TShape;
    Panel3: TPanel;
    Shape61: TShape;
    Shape62: TShape;
    Shape63: TShape;
    Shape64: TShape;
    Shape65: TShape;
    Shape66: TShape;
    Shape67: TShape;
    Shape68: TShape;
    Shape69: TShape;
    Shape72: TShape;
    Shape73: TShape;
    Shape74: TShape;
    Shape75: TShape;
    Shape76: TShape;
    Shape77: TShape;
    Shape79: TShape;
    Shape82: TShape;
    Shape84: TShape;
    Shape116: TShape;
    tvEnsemble: TTreeView;
    GroupBoxNoteColors: TGroupBox;
    PanelSi: TPanel;
    chbSi: TCheckBox;
    ShapeSi: TShape;
    Panel9: TPanel;
    ShapeLaSharp: TShape;
    CheckBoxLaSharp: TCheckBox;
    PanelLa: TPanel;
    ShapeLa: TShape;
    CheckBoxLa: TCheckBox;
    PanelSolSharp: TPanel;
    ShapeSolSharp: TShape;
    CheckBoxSolSharp: TCheckBox;
    PanelSol: TPanel;
    ShapeSol: TShape;
    CheckBoxSol: TCheckBox;
    PanelFaSharp: TPanel;
    ShapeFaSharp: TShape;
    CheckBoxFaSharp: TCheckBox;
    Panel14: TPanel;
    ShapeFa: TShape;
    CheckBoxFa: TCheckBox;
    PanelMi: TPanel;
    ShapeMiSharp: TShape;
    CheckBoxMi: TCheckBox;
    Panel16: TPanel;
    ShapeReSharp: TShape;
    CheckBoxReSharp: TCheckBox;
    Panel17: TPanel;
    ShapeRe: TShape;
    CheckBoxRe: TCheckBox;
    Panel18: TPanel;
    ShapeDoSharp: TShape;
    CheckBoxDoSharp: TCheckBox;
    Panel19: TPanel;
    ShapeDo: TShape;
    CheckBoxDo: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btnWhiteC1Enter(Sender: TObject);
    procedure btnWhiteC1Exit(Sender: TObject);
    procedure btnWhiteC1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btnWhiteC1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPianoClick(Sender: TObject);
    procedure btnWhiteC1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbInstrumentsClick(Sender: TObject);
    procedure trkVelocityChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShapeDoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
  public
    procedure PaintButtons;
  end;

var
  FormMidikeys: TFormMidikeys;
  KeyboardInFocus: Boolean;
  LastFocused: TObject;
  NowInFocus: TObject;
  Playing: Boolean;
  Instrument: Integer;
  Velocity: Integer = 127;

procedure PlayNote(Note: String; Play: Boolean);

var
  Note: String;


implementation //=============================================================

{$R *.dfm}

//--------------------------------------------------------------------------
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
  midiOutShortMsg(hMidiOut, $C0 + Instrument shl 8);
  midiOutShortMsg(hMidiOut, M + N shl 8 + Velocity shl 16)
end;

//--------------------- FormCreate ------------------------------------------
procedure TFormMidikeys.FormCreate(Sender: TObject);
begin
  PaintButtons;
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.FormShow(Sender: TObject);
begin
  OpenMidiDevice;
  cbInstruments.ItemIndex := 0;
end;

//--------------------------------------------------------------------------
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

procedure TFormMidikeys.ShapeDoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  // ColorDialog.Execute;
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.btnWhiteC1Enter(Sender: TObject);
begin
  KeyboardInFocus := True;
  NowInFocus := Sender
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.btnWhiteC1Exit(Sender: TObject);
begin
  KeyboardInFocus := False;
  LastFocused := Sender
end;

//--------------------------------------------------------------------------
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

//--------------------------------------------------------------------------
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
    Note := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', Note, 2)
  end;
  PlayNote(Note, True);
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.btnPianoClick(Sender: TObject);
begin
  // Note Play
  with (Sender as TBitBtn) do
  begin
    Note := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', Note, 2)
  end;
  PlayNote(Note, True);
  PlayNote(Note, False)
end;

//--------------------------------------------------------------------------
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
    Note := Copy(Name, 9, 2);
    if Copy(Name, 1, 8) = 'btnBlack' then
      Insert('#', Note, 2)
  end;
  PlayNote(Note, False);
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.cbInstrumentsClick(Sender: TObject);
begin
  Instrument := cbInstruments.ItemIndex;
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.trkVelocityChange(Sender: TObject);
begin
  Velocity := trkVelocity.Position;
  lblVelocityValue.Caption := IntToStr(Velocity)
end;

//--------------------------------------------------------------------------
procedure TFormMidikeys.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CloseMidiDevice;
end;

//----------------------------------------------------------------------------
procedure TFormMidikeys.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close();
end;
end.
