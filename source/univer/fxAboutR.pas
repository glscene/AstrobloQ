unit fxAboutR;

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
  FMX.TabControl,
  FMX.Memo.Types,
  FMX.Controls.Presentation,
  FMX.ScrollBox,
  FMX.Memo,

  fxForm
  ;

type
  TFormAbout = class(TFormX)
    TextAbout: TText;
    TabControl1: TTabControl;
    Memo1: TMemo;
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
  // TabControl
end;

end.
