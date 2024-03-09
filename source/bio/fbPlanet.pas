unit fbPlanet;

// unused for generation

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
  Vcl.StdCtrls,
  Vcl.Buttons;

type
  TfbPlanet = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edX: TEdit;
    edY: TEdit;
    edZ: TEdit;
    Label5: TLabel;
    edRadius: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edHeight: TEdit;
    edWidth: TEdit;
    cbShowBuild: TCheckBox;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
  private

  public

  end;

var
  fbPlanet: TfbPlanet;

implementation

{$R *.dfm}

end.
