//===============================================
// Called to display mesh data from FormMeshShow
//===============================================
unit fnMeshDataR;

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
  TfrmMeshData = class(TForm)
    rdMeshData: TRichEdit;
  private
     
  public

  end;

procedure ShowMeshData(const aList : TStringList);

var
  frmMeshData: TfrmMeshData;

implementation

{$R *.dfm}

procedure ShowMeshData(const aList : TStringList);
var
  lfrm : TfrmMeshData;
begin
  if aList = nil then
    Exit;

  lfrm := TfrmMeshData.Create(nil);
  try
    lfrm.rdMeshData.Lines.Assign(aList);
    lfrm.ShowModal;
  finally
    FreeAndNil(lfrm);
  end;
end;

end.
