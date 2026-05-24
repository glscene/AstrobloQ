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
  fsPhotonJet_ru,
  fsAstrodron_ru

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
begin
  for var I:Integer := 0 to 4 do
    tvCraft.Items[I].DropHighlighted := False;
  case tvCraft.Selected.Index of
    0:
      begin // Субмарина
        FormSubmarine.Parent := FormCrafts;
        FormSubmarine.Align := alClient;
        FormSubmarine.BorderStyle := bsNone;
        FormSubmarine.Show;
        FormSubmarine.SetFocus; // not GLSceneViewer !
        tvCraft.Items[0].DropHighlighted := True;
      end;
    1:
      begin  // Небесный страж
        FormSkyship.Parent := FormCrafts;
        FormSkyship.Align := alClient;
        FormSkyship.BorderStyle := bsNone;
        FormSkyship.Show;
        FormSkyship.SetFocus;
        tvCraft.Items[1].DropHighlighted := True;
      end;
    2:
      begin // Астродрон
        FormAstrodron.Parent := FormCrafts;
        FormAstrodron.Align := alClient;
        FormAstrodron.BorderStyle := bsNone;
        FormAstrodron.Show;
        FormAstrodron.SetFocus;
        tvCraft.Items[2].DropHighlighted := True;
      end;
    3:
      begin // Гравилёт с варп-двигателем
        FormGravijet.Parent := FormCrafts;
        FormGravijet.Align := alClient;
        FormGravijet.BorderStyle := bsNone;
        FormGravijet.Show;
        tvCraft.Items[3].DropHighlighted := True;
      end;
    4:
      begin // Фотоннная ракета
        FormPhotonjet.Parent := FormCrafts;
        FormPhotonjet.Align := alClient;
        FormPhotonjet.BorderStyle := bsNone;
        FormPhotonjet.Show;
        tvCraft.Items[4].DropHighlighted := True;
      end;
    5:
      begin  // Ядерный буксир
      (*
        FormTugboat.Parent := FormCrafts;
        FormTugboat.Align := alClient;
        FormTugboat.BorderStyle := bsNone;
        FormTugboat.Show;
        tvCraft.Items[5].DropHighlighted := True;
*)
      end;
    6:
      begin // NukeShip
(*
        FormNukeShip.Parent := FormCraft;
        FormNukeShip.Align := alClient;
        FormNukeShip.BorderStyle := bsNone;
        FormNukeShip.Show;
        tvCraft.Items[6].DropHighlighted := True;
*)
      end;

  end;
end;

//----------------------------------------------------------------------------
end.
