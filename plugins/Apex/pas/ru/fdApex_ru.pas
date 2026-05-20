unit fdApex_ru;

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

  fpCoco_ru,
  fpComet_ru,
  fpControl_ru,
  fpEclipse_ru,
  fpEcltimer_ru,
  fpFoto_ru,
  fpLuna_ru,
  fpNewmoon_ru,
  fpNumint_ru,
  fpOccult_ru,
  fpOrbdet_ru,
  fpPhys_ru,
  fpPlanetpos_ru,
  fpPlanetrise_ru,
  fpSunset_ru,

  Vcl.ToolWin;

type
  TFormApex = class(TForm)
    PanelLeft: TPanel;
    tvApex: TTreeView;
    PanelTop: TPanel;
    PanelBottom: TPanel;
    ControlBar: TControlBar;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    procedure About1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvApexClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
  private
  public
  end;

var
  FormApex: TFormApex;

implementation //=============================================================

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
        frmEcltimer := TfrmEcltimer.Create(FormApex);
        frmEcltimer.Parent := FormApex;
        frmEcltimer.Align := alClient;
        frmEcltimer.BorderStyle := bsNone;
        frmEcltimer.Show;
      end;
    4:
      begin // Foto
        frmFoto := TfrmFoto.Create(FormApex);
        frmFoto.Parent := FormApex;
        frmFoto.Align := alClient;
        frmFoto.BorderStyle := bsNone;
        frmFoto.Show;
      end;
    5:
      begin // Luna
        frmLuna := TfrmLuna.Create(FormApex);
        frmLuna.Parent := FormApex;
        frmLuna.Align := alClient;
        frmLuna.BorderStyle := bsNone;
        frmLuna.Show;
      end;
    6:
      begin // Newmoon
        frmNewmoon := TfrmNewmoon.Create(FormApex);
        frmNewmoon.Parent := FormApex;
        frmNewmoon.Align := alClient;
        frmNewmoon.BorderStyle := bsNone;
        frmNewmoon.Show;
      end;
    7:
      begin // Numint
        frmNumint := TfrmNumint.Create(FormApex);
        frmNumint.Parent := FormApex;
        frmNumint.Align := alClient;
        frmNumint.BorderStyle := bsNone;
        frmNumint.Show;
      end;
    8:
      begin // Occult
        frmOccult := TfrmOccult.Create(FormApex);
        frmOccult.Parent := FormApex;
        frmOccult.Align := alClient;
        frmOccult.BorderStyle := bsNone;
        frmOccult.Show;
      end;
    9:
      begin // Orbdet
        frmOrbdet := TfrmOrbdet.Create(FormApex);
        frmOrbdet.Parent := FormApex;
        frmOrbdet.Align := alClient;
        frmOrbdet.BorderStyle := bsNone;
        frmOrbdet.Show;
      end;
    10:
      begin // Phys
        frmPhys := TfrmPhys.Create(FormApex);
        frmPhys.Parent := FormApex;
        frmPhys.Align := alClient;
        frmPhys.BorderStyle := bsNone;
        frmPhys.Show;
      end;
    11:
      begin // Planetpos
        frmPlanetpos := TfrmPlanetpos.Create(FormApex);
        frmPlanetpos.Parent := FormApex;
        frmPlanetpos.Align := alClient;
        frmPlanetpos.BorderStyle := bsNone;
        frmPlanetpos.Show;
      end;
    12:
      begin // Planetrise
        frmPlanetrise := TfrmPlanetrise.Create(FormApex);
        frmPlanetrise.Parent := FormApex;
        frmPlanetrise.Align := alClient;
        frmPlanetrise.BorderStyle := bsNone;
        frmPlanetrise.Show;
      end;
    13:
      begin // Sunset
        frmSunset := TfrmSunset.Create(FormApex);
        frmSunset.Parent := FormApex;
        frmSunset.Align := alClient;
        frmSunset.BorderStyle := bsNone;
        frmSunset.Show;
      end;
  end;
end;

procedure TFormApex.About1Click(Sender: TObject);
begin
  //
end;

end.
