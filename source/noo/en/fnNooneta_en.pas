(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fnNooneta_en;

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

  fnSkyship_en,
  fnSubmarine_en,
  fnGravijet_en,
  fnPhotonJet_en,
  fnAstrodron_en
  (*,
  fnNukeShip_en
  *)
  ;

type
  TFormCrafts = class(TForm)
    PanelLeft: TPanel;
    tvCraft: TTreeView;
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Open1: TMenuItem;
    Exit1: TMenuItem;
    Create1: TMenuItem;
    N1: TMenuItem;
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
  for var I: Integer := 0 to 4 do
    tvCraft.Items[I].DropHighlighted := False;
  case tvCraft.Selected.Index of
    0:
      begin  // Submarine
        FormSubmarine.Parent := FormCrafts;
        FormSubmarine.Align := alClient;
        FormSubmarine.BorderStyle := bsNone;
        FormSubmarine.Show;
        FormSubmarine.SetFocus;
        tvCraft.Items[0].DropHighlighted := True;
      end;
    1:
      begin // Skyship
        FormSkyship.Parent := FormCrafts;
        FormSkyship.Align := alClient;
        FormSkyship.BorderStyle := bsNone;
        FormSkyship.Show;
        FormSkyship.SetFocus;
        tvCraft.Items[1].DropHighlighted := True;
      end;
    2:
      begin // Astrodron
        FormAstrodron.Parent := FormCrafts;
        FormAstrodron.Align := alClient;
        FormAstrodron.BorderStyle := bsNone;
        FormAstrodron.Show;
        FormAstrodron.SetFocus;
        tvCraft.Items[2].DropHighlighted := True;
      end;
    3:
      begin // Warpdrive
        FormGravijet.Parent := FormCrafts;
        FormGravijet.Align := alClient;
        FormGravijet.BorderStyle := bsNone;
        FormGravijet.Show;
        tvCraft.Items[3].DropHighlighted := True;
      end;
    4:
      begin // Photonjet
        FormPhotonjet.Parent := FormCrafts;
        FormPhotonjet.Align := alClient;
        FormPhotonjet.BorderStyle := bsNone;
        FormPhotonjet.Show;
        tvCraft.Items[4].DropHighlighted := True;
      end;
    5:
      begin  // Nukeship
      (*
        FormNukeship.Parent := FormCrafts;
        FormNukeship.Align := alClient;
        FormNukeship.BorderStyle := bsNone;
        FormNukeship.Show;
        tvCraft.Items[5].DropHighlighted := True;
*)
      end;
  end;
end;

//----------------------------------------------------------------------------
end.
