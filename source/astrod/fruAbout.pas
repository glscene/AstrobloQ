unit fruAbout;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,

  fruForm, FMX.Objects;

type
  TFormAbout = class(TFormI)
    TextAbout: TText;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.fmx}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  inherited;
  ActiveLang := 'en';
end;

end.
