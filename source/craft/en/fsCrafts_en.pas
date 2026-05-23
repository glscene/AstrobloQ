(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fsCrafts_en;

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
  Vcl.Menus,
  Vcl.ComCtrls,

  fsSkyship_en,
  fsSubmarine_en,
  fsGravijet_en,
  fsPhotonJet_en
  (*,
  fsNukeShip_en
  *)
  ;

type
  TFormCrafts = class(TForm)
    PanelLeft: TPanel;
    tvCraft: TTreeView;
    MainMenu: TMainMenu;
    procedure tvCraftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  FormCrafts: TFormCrafts;

implementation //=============================================================

{$R *.dfm}

//----------------------------------------------------------------------------
procedure TFormCrafts.FormShow(Sender: TObject);
begin
  tvCraft.Select(tvCraft.Items[0]);  // goto to column 0
  tvCraftClick(Sender);
end;

//----------------------------------------------------------------------------
procedure TFormCrafts.tvCraftClick(Sender: TObject);
begin
  tvCraft.Items[0].DropHighlighted := False;
  case tvCraft.Selected.Index of
    0:
      begin // Skyship
        FormSkyship.Parent := FormCrafts;
        FormSkyship.Align := alClient;
        FormSkyship.BorderStyle := bsNone;
        FormSkyship.Show;
      end;
    1:
      begin // Submarine
        FormSubmarine.Parent := FormCrafts;
        FormSubmarine.Align := alClient;
        FormSubmarine.BorderStyle := bsNone;
        FormSubmarine.Show;
      end;
    2:
      begin // Gravijet
        FormGravijet.Parent := FormCrafts;
        FormGravijet.Align := alClient;
        FormGravijet.BorderStyle := bsNone;
        FormGravijet.Show;
      end;
    3:
      begin // Photonjet
        FormPhotonjet.Parent := FormCrafts;
        FormPhotonjet.Align := alClient;
        FormPhotonjet.BorderStyle := bsNone;
        FormPhotonjet.Show;
      end;
    4:
      begin  // Nukeship
      (*
        FormNukeship.Parent := FormCrafts;
        FormNukeship.Align := alClient;
        FormNukeship.BorderStyle := bsNone;
        FormNukeship.Show;
*)
      end;
  end;
end;

//----------------------------------------------------------------------------
end.
