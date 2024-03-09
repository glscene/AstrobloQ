unit fbNewReality;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Bio.Reality;

type
  TFormNewReality = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edCreator: TEdit;
    Panel3: TPanel;
    Panel4: TPanel;
    edWidth: TEdit;
    Panel5: TPanel;
    Panel6: TPanel;
    edEnvironment: TEdit;
    Panel7: TPanel;
    Panel8: TPanel;
    edHeight: TEdit;
    UpDownWidth: TUpDown;
    UpDownHeight: TUpDown;
    Panel11: TPanel;
    Panel12: TPanel;
    edTension: TEdit;
    UpDownTension: TUpDown;
    Panel19: TPanel;
    btnBarren: TBitBtn;
    btnDirty: TBitBtn;
    btnGrass: TBitBtn;
    btnWatery: TBitBtn;
    Panel20: TPanel;
    Panel22: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel23: TPanel;
    Panel21: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    edWater: TEdit;
    UpDownWater: TUpDown;
    Panel9: TPanel;
    Panel10: TPanel;
    edLandHeight: TEdit;
    UpDownLandHeight: TUpDown;
    Panel17: TPanel;
    Panel18: TPanel;
    edHumidity: TEdit;
    UpDownHumidity: TUpDown;
    Panel15: TPanel;
    Panel16: TPanel;
    edTemp: TEdit;
    UpDownTemp: TUpDown;
    Panel24: TPanel;
    cbContinents: TCheckBox;
    cbIslands: TCheckBox;
    cbHalo: TCheckBox;
    cbSun: TCheckBox;
    Label1: TLabel;
    edContinents: TEdit;
    edIslands: TEdit;
    cbFrozenPoles: TCheckBox;
    Panel25: TPanel;
    Label2: TLabel;
    cbFuzzy: TCheckBox;
    UpDownContinents: TUpDown;
    UpDownIslands: TUpDown;
    Panel26: TPanel;
    Panel27: TPanel;
    edPlanetRadius: TEdit;
    UpDownRadius: TUpDown;
    procedure UpDownWidthClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownHeightClick(Sender: TObject; Button: TUDBtnType);
    procedure btnBarrenClick(Sender: TObject);
    procedure btnDirtyClick(Sender: TObject);
    procedure btnGrassClick(Sender: TObject);
    procedure btnWateryClick(Sender: TObject);
    procedure UpDownTensionClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownWaterClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownLandHeightClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownHumidityClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownTempClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownContinentsClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownIslandsClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDownRadiusClick(Sender: TObject; Button: TUDBtnType);
  private
     
  public
     
    procedure ExtractValues(aReality: AIReality);
  end;

var
  FormNewReality: TFormNewReality;

implementation

uses Bio.Things;

{$R *.DFM}

procedure TFormNewReality.UpDownWidthClick(Sender: TObject; Button: TUDBtnType);
begin
  edWidth.Text := IntToStr(UpDownWidth.Position);
end;

procedure TFormNewReality.UpDownHeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edHeight.Text := IntToStr(UpDownHeight.Position);
end;

procedure TFormNewReality.UpDownRadiusClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edPlanetRadius.Text := IntToStr(UpDownRadius.Position);
end;

procedure TFormNewReality.btnBarrenClick(Sender: TObject);
begin
  edWater.Text := '0'; UpDownWater.Position := 0;
  edLandHeight.Text := '5'; UpDownLandHeight.Position := 5;
  edHumidity.Text := '0'; UpDownHumidity.Position := 0;
  edTemp.Text := '0'; UpDownTemp.Position := 0;
end;

procedure TFormNewReality.btnDirtyClick(Sender: TObject);
begin
  edWater.Text := '2'; UpDownWater.Position := 2;
  edLandHeight.Text := '10'; UpDownLandHeight.Position := 10;
  edHumidity.Text := '8'; UpDownHumidity.Position := 8;
  edTemp.Text := '5'; UpDownTemp.Position := 5;
end;

procedure TFormNewReality.btnGrassClick(Sender: TObject);
begin
  edWater.Text := '20'; UpDownWater.Position := 20;
  edLandHeight.Text := '25'; UpDownLandHeight.Position := 25;
  edHumidity.Text := '5'; UpDownHumidity.Position := 5;
  edTemp.Text := '2'; UpDownTemp.Position := 2;
end;

procedure TFormNewReality.btnWateryClick(Sender: TObject);
begin
  edWater.Text := '25'; UpDownWater.Position := 25;
  edLandHeight.Text := '5'; UpDownLandHeight.Position := 5;
  edHumidity.Text := '5'; UpDownHumidity.Position := 5;
  edTemp.Text := '2'; UpDownTemp.Position := 2;
end;

procedure TFormNewReality.UpDownTensionClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edTension.Text := IntToStr(UpDownTension.Position);
end;

procedure TFormNewReality.UpDownWaterClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edWater.Text := IntToStr(UpDownWater.Position);
end;

procedure TFormNewReality.UpDownLandHeightClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edLandHeight.Text := IntToStr(UpDownLandHeight.Position);
end;

procedure TFormNewReality.UpDownHumidityClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edHumidity.Text := IntToStr(UpDownHumidity.Position);
end;

procedure TFormNewReality.UpDownTempClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edTemp.Text := IntToStr(UpDownTemp.Position);
end;

procedure TFormNewReality.UpDownContinentsClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edContinents.Text := IntToStr(UpDownContinents.Position);
end;

procedure TFormNewReality.UpDownIslandsClick(Sender: TObject;
  Button: TUDBtnType);
begin
  edIslands.Text := IntToStr(UpDownIslands.Position);
end;

procedure TFormNewReality.ExtractValues(aReality: AIReality);
begin
  aReality.Creator := edCreator.Text;
  aReality.Environment.Name := edEnvironment.Text;
  aReality.Environment.Space.DefaultHeight := UpDownLandHeight.Position;
  aReality.Environment.Space.DefaultWater := UpDownWater.Position;
  aReality.Environment.Space.DefaultTemperature := UpDownTemp.Position;
  aReality.Environment.Space.DefaultHumidity := UpDownHumidity.Position;
  aReality.Environment.Space.Radius := UpDownRadius.Position;
  aReality.Build(UpDownWidth.Position, UpDownHeight.Position);
  if cbContinents.Checked then
    aReality.Environment.Space.GenerateContinents(UpDownContinents.Position);
  if cbIslands.Checked then
    aReality.Environment.Space.GenerateIslands(UpDownIslands.Position);
  if cbHalo.Checked then
    aReality.Environment.Space.GenerateHalo;
  if cbSun.Checked then
    aReality.Environment.Things.NewThing(cSun);
  if cbFrozenPoles.Checked then
    aReality.Environment.Space.FreezePoles;
  if cbFuzzy.Checked then
    aReality.Environment.Space.FuzzyHeight(16);
end;

end.
