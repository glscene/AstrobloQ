// ---------------------------------------------------------------------------
// This unit is part of the Geoblock Project, http://sourceforge.net/projects/geoblock
// ---------------------------------------------------------------------------
{ ! InitialForm is a parent for all inherited fmx forms }

unit fxFormO;

interface

uses
  System.Win.Registry,
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.ImageList,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Dialogs,
  FMX.ImgList,
  FMX.Menus,
  FMX.Edit,
  FMX.Memo;


type
  TfmInitialForm = class(TForm)
  private
  public
    procedure ReadIniFile; virtual;
    procedure WriteIniFile;
    // translate a text,which is not in the autotranslation process of TLang
  end;

var
  fmInitialForm: TfmInitialForm;

implementation // ------------------------------------------------------------

{$R *.fmx}

{ TfmInitialForm }

procedure TfmInitialForm.ReadIniFile;
begin
  //
end;

procedure TfmInitialForm.WriteIniFile;
begin
  //
end;

initialization

end.
