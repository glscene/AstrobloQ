unit fpApex;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.Menus,

  fpCoco,
  fpComet,
  fpControl,
  fpEclipse,
  fpEcltimer,
  fpFoto,
  fpLuna,
  fpNewmoon,
  fpNumint,
  fpOccult,
  fpOrbdet,
  fpPhys,
  fpPlanetpos,
  fpPlanetrise,
  fpSunset, Vcl.ToolWin;

type
  TFormApex = class(TForm)
    PanelLeft: TPanel;
    tvApex: TTreeView;
    PanelTop: TPanel;
    PanelBottom: TPanel;
    MainMenu: TMainMenu;
    miFile: TMenuItem;
    miNew: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    N2: TMenuItem;
    miExit: TMenuItem;
    miEdit: TMenuItem;
    Undo1: TMenuItem;
    N5: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    N4: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    Window1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    miAbout: TMenuItem;
    ControlBar: TControlBar;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvApexClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private
  public
  end;

var
  FormApex: TFormApex;

implementation

{$R *.dfm}

procedure TFormApex.FormCreate(Sender: TObject);
begin
  tvApex.Select(tvApex.Items[0]);  // goto to column 0
  tvApexClick(Sender);
end;

procedure TFormApex.miExitClick(Sender: TObject);
begin
  Close();
end;

procedure TFormApex.tvApexClick(Sender: TObject);
begin
  tvApex.Items[0].DropHighlighted := False;
  case tvApex.Selected.Index of
    0:
      begin // Coco - преобразование координат
        FormCoco := TFormCoco.Create(FormApex);
        FormCoco.Parent := FormApex;
        FormCoco.Align := alClient;
        FormCoco.BorderStyle := bsNone;
        FormCoco.Show;
      end;
    1:
      begin // Comet -
        FormComet := TFormComet.Create(FormApex);
        FormComet.Parent := FormApex;
        FormComet.Align := alClient;
        FormComet.BorderStyle := bsNone;
        FormComet.Show;
      end;
    2:
      begin // Eclipse
        FormEclipse := TFormEclipse.Create(FormApex);
        FormEclipse.Parent := FormApex;
        FormEclipse.Align := alClient;
        FormEclipse.BorderStyle := bsNone;
        FormEclipse.Show;
      end;
    3:
      begin // Ecltimer
        FormEcltimer := TFormEcltimer.Create(FormApex);
        FormEcltimer.Parent := FormApex;
        FormEcltimer.Align := alClient;
        FormEcltimer.BorderStyle := bsNone;
        FormEcltimer.Show;
      end;
    4:
      begin // Foto
        FormFoto := TFormFoto.Create(FormApex);
        FormFoto.Parent := FormApex;
        FormFoto.Align := alClient;
        FormFoto.BorderStyle := bsNone;
        FormFoto.Show;
      end;
    5:
      begin // Luna
        FormLuna := TFormLuna.Create(FormApex);
        FormLuna.Parent := FormApex;
        FormLuna.Align := alClient;
        FormLuna.BorderStyle := bsNone;
        FormLuna.Show;
      end;
    6:
      begin // Newmoon
        FormNewmoon := TFormNewmoon.Create(FormApex);
        FormNewmoon.Parent := FormApex;
        FormNewmoon.Align := alClient;
        FormNewmoon.BorderStyle := bsNone;
        FormNewmoon.Show;
      end;
    7:
      begin // Numint
        FormNumint := TFormNumint.Create(FormApex);
        FormNumint.Parent := FormApex;
        FormNumint.Align := alClient;
        FormNumint.BorderStyle := bsNone;
        FormNumint.Show;
      end;
    8:
      begin // Occult
        FormOccult := TFormOccult.Create(FormApex);
        FormOccult.Parent := FormApex;
        FormOccult.Align := alClient;
        FormOccult.BorderStyle := bsNone;
        FormOccult.Show;
      end;
    9:
      begin // Orbdet
        FormOrbdet := TFormOrbdet.Create(FormApex);
        FormOrbdet.Parent := FormApex;
        FormOrbdet.Align := alClient;
        FormOrbdet.BorderStyle := bsNone;
        FormOrbdet.Show;
      end;
    10:
      begin // Phys
        FormPhys := TFormPhys.Create(FormApex);
        FormPhys.Parent := FormApex;
        FormPhys.Align := alClient;
        FormPhys.BorderStyle := bsNone;
        FormPhys.Show;
      end;
    11:
      begin // Planetpos
        FormPlanetpos := TFormPlanetpos.Create(FormApex);
        FormPlanetpos.Parent := FormApex;
        FormPlanetpos.Align := alClient;
        FormPlanetpos.BorderStyle := bsNone;
        FormPlanetpos.Show;
      end;
    12:
      begin // Planetrise
        FormPlanetrise := TFormPlanetrise.Create(FormApex);
        FormPlanetrise.Parent := FormApex;
        FormPlanetrise.Align := alClient;
        FormPlanetrise.BorderStyle := bsNone;
        FormPlanetrise.Show;
      end;
    13:
      begin // Sunset
        FormSunset := TFormSunset.Create(FormApex);
        FormSunset.Parent := FormApex;
        FormSunset.Align := alClient;
        FormSunset.BorderStyle := bsNone;
        FormSunset.Show;
      end;
  end;
end;

procedure TFormApex.About1Click(Sender: TObject);
begin
  //
end;

end.
