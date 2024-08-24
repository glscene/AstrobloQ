unit fdAbout;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.Math.Vectors,
  FMX.Controls3D,
  FMX.Objects3D,
  FMX.Objects,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,

  fdForm;

type
  TFormAbout = class(TFormO)
    TextAbout: TText;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormAbout: TFormAbout;

implementation //-------------------------------------------------------------

{$R *.fmx}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  inherited;
  ActiveLang := 'en';
end;

end.
