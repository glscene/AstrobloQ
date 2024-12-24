unit fxStellarfon;

// The unit is part of the AstrobloQ

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
  TFormStellarfon = class(TForm3D)
    PanelLeft: TPanel;
    procedure Form3DCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStellarfon: TFormStellarfon;

implementation

{$R *.fmx}

procedure TFormStellarfon.Form3DCreate(Sender: TObject);
begin
  // load audio from \assets
end;

end.
