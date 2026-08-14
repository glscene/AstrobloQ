(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
unit fnNooneta_ru;

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

  fnLocator_ru,
  fnSkyship_ru,
  fnSubmarine_ru,
  fnGravijet_ru,
  fnPhotonJet_ru,
  fnAstrodron_ru

  (*,
  fnNukeShip_ru
  *)
  ;

type
  TFormCrafts = class(TForm)
    PanelLeft: TPanel;
    tvCraft: TTreeView;
    MainMenu: TMainMenu;
    F1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure tvCraftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N3Click(Sender: TObject);
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
  tvCraft.Select(tvCraft.Items[1]);  // переход к 1му узлу
  tvCraftClick(Sender);
end;

//----------------------------------------------------------------------
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
      begin // Ноолокатор
        Application.CreateForm(TFormTerraNavi, FormTerraNavi);
//        FormTerraNavi.Parent := FormCrafts;
        FormTerraNavi.Align := alClient;
        FormTerraNavi.BorderStyle := bsNone;
        FormTerraNavi.Show;
        tvCraft.Items[5].DropHighlighted := True;
(**)
      end;
    6:
      begin  //
      (*
        FormTugboat.Parent := FormCrafts;
        FormTugboat.Align := alClient;
        FormTugboat.BorderStyle := bsNone;
        FormTugboat.Show;
        tvCraft.Items[5].DropHighlighted := True;
*)
      end;
    7:
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
procedure TFormCrafts.N3Click(Sender: TObject);
begin
  Close;
end;

//----------------------------------------------------------------------------
end.
