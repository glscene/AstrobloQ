unit fxGridGeneration;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  FMX.Types,
  FMX.Graphics,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.StdCtrls,
  FMX.ImgList,
  FMX.Edit,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Controls.Presentation,
  FMX.Objects,

  uxGlobals,
  fxMethodDialog;


type
  TFormMethodGridGeneration = class(TfmMethodDialog)
    gbModelSize: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FormMethodGridGeneration: TFormMethodGridGeneration;

implementation //------------------------------------------------------------

{$R *.fmx}

procedure TFormMethodGridGeneration.FormCreate(Sender: TObject);
begin
  inherited;
 //
end;

//---------------------------------------------------------------------------

end.
