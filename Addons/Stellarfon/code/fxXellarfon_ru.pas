unit fxXellarfon_ru;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms3D,
  FMX.Types3D,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfrmXellarfon = class(TForm3D)
    PanelLeft: TPanel;
    procedure Form3DCreate(Sender: TObject);
  private
  public
  end;

var
  frmXellarfon: TfrmXellarfon;

implementation //=============================================================

{$R *.fmx}

procedure TfrmXellarfon.Form3DCreate(Sender: TObject);
begin
  // load audio from \assets
end;

end.
