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
begin
  tvCraft.Items[0].DropHighlighted := False;
  case tvCraft.Selected.Index of
    0:
      begin // Челнок
        FormSkyship.Parent := FormCrafts;
        FormSkyship.Align := alClient;
        FormSkyship.BorderStyle := bsNone;
        FormSkyship.Show;
      end;
    1:
      begin // Подлодка
        FormSubmarine.Parent := FormCrafts;
        FormSubmarine.Align := alClient;
        FormSubmarine.BorderStyle := bsNone;
        FormSubmarine.Show;
      end;
    2:
      begin // Гравилёт
        FormGravijet.Parent := FormCrafts;
        FormGravijet.Align := alClient;
        FormGravijet.BorderStyle := bsNone;
        FormGravijet.Show;
      end;
    3:
      begin // Фотонджет
        FormPhotonjet.Parent := FormCrafts;
        FormPhotonjet.Align := alClient;
        FormPhotonjet.BorderStyle := bsNone;
        FormPhotonjet.Show;
      end;
    4:
      begin  // Буксир
      (*
        FormTugboat.Parent := FormCrafts;
        FormTugboat.Align := alClient;
        FormTugboat.BorderStyle := bsNone;
        FormTugboat.Show;
*)
      end;
    5:
      begin // NukeShip
(*
        FormNukeShip.Parent := FormCraft;
        FormNukeShip.Align := alClient;
        FormNukeShip.BorderStyle := bsNone;
        FormNukeShip.Show;
*)
      end;

  end;
end;

//----------------------------------------------------------------------------
end.
