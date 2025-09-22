unit fbHumidityMap_ru;

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

  fbHeightField_ru;

type
  TFormHumidityMap = class(TFormHeightField)
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    Initialized: boolean;
  public
  end;

var
  FormHumidityMap: TFormHumidityMap;

implementation //-------------------------------------------------------------

uses
  fbFirstForm_ru;

{$R *.dfm}

procedure TFormHumidityMap.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  HeatField.OnGetHeight := HumidityFormula;
end;

procedure TFormHumidityMap.FormShow(Sender: TObject);
begin
  Initialized := false;
  // Показать карту влажности
end;

procedure TFormHumidityMap.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := false;
  frmFirst.RealityForm.ManagerForm.DropHumidityMap;
end;

end.
