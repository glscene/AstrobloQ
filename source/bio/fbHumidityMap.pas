unit fbHumidityMap;

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
  fbHeightField;

type
  TFormHumidityMap = class(TFormHeightField)
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
  public
  end;

var
  FormHumidityMap: TFormHumidityMap;

//============================================================================
implementation

uses
  fbFirstForm;

{$R *.dfm}

procedure TFormHumidityMap.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  HeatField.OnGetHeight := HumidityFormula;
end;

procedure TFormHumidityMap.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := false;
  frmFirst.RealityForm.ManagerForm.DropHumidityMap;
end;

end.
