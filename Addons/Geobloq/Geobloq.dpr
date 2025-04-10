program Geobloq;

{$R 'Gexoblock.res' 'bin\Gexoblock.rc'}

uses
  FMX.Forms,
  System.SysUtils,
  System.IOUtils,
  fxFormO in 'source\fxFormO.pas' {fmInitialForm},
  fxDialogO in 'source\fxDialogO.pas' {fmInitialDialog},
  fxHelpAbout in 'source\fxHelpAbout.pas' {fmHelpAbout},
  fxToolsOptions in 'source\fxToolsOptions.pas' {fmToolsOptions},
  dxBase in 'source\dxBase.pas' {dmBase: TDataModule},
  dxDialogs in 'source\dxDialogs.pas' {dmDialogs: TDataModule},
  Geos.ResStrings in 'source\Geos.ResStrings.pas',
  uxGlobals in 'source\uxGlobals.pas',
  uxObjects3D in 'source\uxObjects3D.pas',
  uxInverseDistance in 'source\uxInverseDistance.pas',
  fxDataBrowser in 'source\fxDataBrowser.pas' {fmFileDataBrowser},
  fxMethodDialog in 'source\fxMethodDialog.pas' {fmMethodDialog},
  fxMethodDualDialog in 'source\fxMethodDualDialog.pas' {fmMethodDualDialog},
  fxInterpolation in 'source\fxInterpolation.pas' {fmMethodInterpolation},
  fxGeobloq in 'source\fxGeobloq.pas' {frmGeobloq},
  fxGridGeneration in 'source\fxGridGeneration.pas' {fmMethodGridGeneration},
  uxCommon in 'source\uxCommon.pas',
  dxImages in 'source\dxImages.pas' {dmImages: TDataModule},
  fxAssayGeneration in 'source\fxAssayGeneration.pas' {fmMethodAssayGeneration},
  fxPitOptimization in 'source\fxPitOptimization.pas' {fmMethodPitOptimization},
  frxShowScene in 'source\frxShowScene.pas' {FrameShowScene: TFrame},
  GBX.TerraModels in 'source\GBX.TerraModels.pas',
  frxDataBrowser in 'source\frxDataBrowser.pas' {FrameDataBrowser: TFrame},
  frxShowTable in 'source\frxShowTable.pas' {FrameShowTable: TFrame},
  uxDelaunay3D in 'source\uxDelaunay3D.pas',
  uInterpol in 'source\uInterpol.pas',
  uDiscoCore in 'source\uDiscoCore.pas',
  uDiscoMetric in 'source\uDiscoMetric.pas',
  uDiscoPoly in 'source\uDiscoPoly.pas',
  Geos.Profuns in 'source\Geos.Profuns.pas',
  uSorting in 'source\uSorting.pas',
  uSuperblock in 'source\uSuperblock.pas',
  uxClosestPointInt in 'source\uxClosestPointInt.pas',
  uxKriging in 'source\uxKriging.pas',
  uxTetraMesh in 'source\uxTetraMesh.pas',
  uxVariograms in 'source\uxVariograms.pas',
  uObjects3D in 'source\uObjects3D.pas',
  uxUtils in '..\..\source\uxUtils.pas';

{$R *.res}

type
  TAppExcept = class(TObject)
  private
    procedure ExceptionsControl(Sender: TObject; E: Exception);
  end;

procedure TAppExcept.ExceptionsControl(Sender: TObject; E: Exception);
var
  S: String;
begin
  S:= Format('%S'+#9+'%S',[DateTimeToStr(Now),E.Message]);
  TFile.AppendAllText('Errors.log', S+#10#13);
  Application.ShowException(E);
end;

var
  AppExcept: TAppExcept;

begin
  Application.Initialize;
  AppExcept := TAppExcept.Create;
  Application.OnException:= AppExcept.ExceptionsControl;
  Application.CreateForm(TdmBase, dmBase);
  Application.CreateForm(TdmDialogs, dmDialogs);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmGeobloq, frmGeobloq);
  Application.Run;
end.
