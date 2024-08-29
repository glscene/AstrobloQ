unit fxAbout;

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
  FMX.Controls.Presentation,
  FMX.StdCtrls;

type
  TfmAbout = class(TForm)
    btnClose: TButton;
    Langs: TLang;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  fmAbout: TfmAbout;

implementation //--------------------------------------------------------------

{$R *.fmx}

procedure TfmAbout.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAbout.FormCreate(Sender: TObject);
begin
  fmAbout.Caption := Translate(fmAbout.Caption);
end;

end.
