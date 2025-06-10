//===============================================
// Called to display mesh data from FormMeshShow
//===============================================
unit ftMeshData;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFormMeshData = class(TForm)
    rdMeshData: TRichEdit;
  private
     
  public
     
  end;

procedure ShowMeshData(const aList : TStringList);

var
  FormMeshData: TFormMeshData;

implementation

{$R *.dfm}

procedure ShowMeshData(const aList : TStringList);
var
  lfrm : TFormMeshData;
begin
  if aList = nil then
    Exit;
    
  lfrm := TFormMeshData.Create(nil);
  try
    lfrm.rdMeshData.Lines.Assign(aList);
    lfrm.ShowModal;
  finally
    FreeAndNil(lfrm);
  end;
end;

end.
