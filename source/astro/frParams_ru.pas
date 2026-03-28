unit frParams_ru;

interface

uses
  System.SysUtils,
  System.Classes,
  System.TypInfo,

  Vcl.Forms,
  Vcl.StdCtrls,

  GLS.Scene,
  GLS.Objects,
  GLS.GeomObjects;

type
  TFrameParamsR = class(TFrame)
    procedure edKeyPress(Sender: TObject; var Key: Char);
    procedure edChange(Sender: TObject);
  public
    lastPickObject: TGLBaseSceneObject;
    procedure ShowParams;
  end;

implementation //==============================================================

uses
  faStellarSys_ru;

{$R *.dfm}

//----------------------------------------------------------------------------
// ShowParams
//----------------------------------------------------------------------------
procedure TFrameParamsR.ShowParams;

  procedure addLabel(x, y: integer; cap: string);
  var
    lbl: TLabel;
  begin
    lbl := TLabel.Create(self);
    lbl.Left := x;
    lbl.Top := y;
    lbl.Caption := cap;
    lbl.Parent := self;
  end;

  //----------------------------------------------------------------------------
  procedure addSpin(x, y, w: integer; prm: string; prm2: string = '');
  var
    ed: TEdit;
    param: PPropInfo;
  begin
    ed := TEdit.Create(self);
    ed.Parent := self;
    ed.Hint := prm;
    ed.Left := x;
    ed.Top := y;
    ed.Width := w;
    ed.Height := 20;
    ed.OnKeyPress := edKeyPress;
    ed.OnChange := edChange;
    param := GetPropInfo(frmStellarSys.PickObject, PChar(prm));
    if param <> nil then
    begin
      if param.PropType^.Kind = tkInteger then
        ed.Tag := 10
      else if param.PropType^.Kind = tkFloat then
        ed.Tag := 11;
      case ed.Tag of
        10:
          ed.Text := IntToStr(GetOrdProp(frmStellarSys.PickObject, param));
        11:
          ed.Text := Format('%.4f', [GetFloatProp(frmStellarSys.PickObject, param)]);
      end;
    end;
  end;

var
  i: integer;

begin
{
  with FormSolarSys do
  begin
    if (lastPickObject <> PickObject) or (PickObject = nil) then
      for i := self.ControlCount - 1 downto 0 do
        self.Controls[i].Free
    else
      exit;
    lastPickObject := PickObject;
    if PickObject = nil then
      exit;
    if PickObject is TGLCube then
    begin
      addLabel(10, 10, 'Width:');
      addSpin(120, 8, 64, 'CubeWidth');
      addLabel(10, 30, 'Depth:');
      addSpin(120, 28, 64, 'CubeDepth');
      addLabel(10, 50, 'Height:');
      addSpin(120, 48, 64, 'CubeHeight');
    end
    else if PickObject is TGLSphere then
    begin
      addLabel(10, 10, 'Radius:');
      addSpin(120, 8, 64, 'Radius');
      addLabel(10, 30, 'Slices:');
      addSpin(120, 28, 64, 'Slices');
      addLabel(10, 50, 'Stacks:');
      addSpin(120, 48, 64, 'Stacks');
    end
    else if PickObject is TGLDisk then
    begin
      addLabel(10, 10, 'Base Width:');
      addSpin(120, 8, 64, 'BaseWidth');
      addLabel(10, 30, 'Base Depth:');
      addSpin(120, 28, 64, 'BaseDepth');
      addLabel(10, 70, 'Height:');
      addSpin(120, 68, 64, 'Height');
    end;
  end;
{}
end;

//----------------------------------------------------------------------------
// edKeyPress
//----------------------------------------------------------------------------
procedure TFrameParamsR.edKeyPress;
begin
  case Key of
    '0' .. '9', ',', '-', #13, #8:
      ;
  else
    Key := #0;
  end;
end;

//----------------------------------------------------------------------------
// edChange
//----------------------------------------------------------------------------
procedure TFrameParamsR.edChange;
var
  param: PPropInfo;
  i: integer;
  f: single;

begin
  with TEdit(Sender) do
  begin
    param := GetPropInfo(frmStellarSys.PickObject, pchar(Hint));
    if param <> nil then
    begin
      case Tag of
        10:
          begin
            if not TryStrToInt(Text, i) then
              i := 0;
            SetOrdProp(frmStellarSys.PickObject, param, i);
          end;
        11:
          begin
            if not TryStrToFloat(Text, f) then
              f := 0;
            SetFloatProp(frmStellarSys.PickObject, param, f);
          end;
      end;
    end;
  end;
end;

//----------------------------------------------------------------------------
end.
