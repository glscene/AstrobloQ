(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fsCrafts_ru;

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

  fsSkyship_ru,
  fsSubmarine_ru,
  fsGravijet_ru,
  fsPhotonJet_ru

  (*,
  fsNukeShip_ru
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
var
  I:Integer;
begin
  for I := 0 to 3 do
    tvCraft.Items[I].DropHighlighted := False;
  case tvCraft.Selected.Index of
    0:
      begin
        FormSubmarine.Parent := FormCrafts;
        FormSubmarine.Align := alClient;
        FormSubmarine.BorderStyle := bsNone;
        FormSubmarine.Show;
        FormSubmarine.SetFocus; // not GLSceneViewer1
        tvCraft.Items[0].DropHighlighted := True;
      end;
    1:
      begin
        FormSkyship.Parent := FormCrafts;
        FormSkyship.Align := alClient;
        FormSkyship.BorderStyle := bsNone;
        FormSkyship.Show;
        FormSkyship.GLSceneViewer.SetFocus;
        tvCraft.Items[1].DropHighlighted := True;
      end;
    2:
      begin // √равилЄт
        FormGravijet.Parent := FormCrafts;
        FormGravijet.Align := alClient;
        FormGravijet.BorderStyle := bsNone;
        FormGravijet.Show;
        tvCraft.Items[2].DropHighlighted := True;
      end;
    3:
      begin // ‘отоннна€ ракета
        FormPhotonjet.Parent := FormCrafts;
        FormPhotonjet.Align := alClient;
        FormPhotonjet.BorderStyle := bsNone;
        FormPhotonjet.Show;
        tvCraft.Items[3].DropHighlighted := True;
      end;
    4:
      begin  // ядерный буксир
      (*
        FormTugboat.Parent := FormCrafts;
        FormTugboat.Align := alClient;
        FormTugboat.BorderStyle := bsNone;
        FormTugboat.Show;
        tvCraft.Items[4].DropHighlighted := True;
*)
      end;
    5:
      begin // NukeShip
(*
        FormNukeShip.Parent := FormCraft;
        FormNukeShip.Align := alClient;
        FormNukeShip.BorderStyle := bsNone;
        FormNukeShip.Show;
        tvCraft.Items[5].DropHighlighted := True;
*)
      end;

  end;
end;

//----------------------------------------------------------------------------
end.
