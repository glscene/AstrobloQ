(*
   Lithosphere - terrestrial exoplanets for near solar stars.
   The atmospheric effect is rendered in DirectOpenGLRender, which essentially
   renders a disk, with color of the vertices computed via ray-tracing. Not that
   the tesselation of the disk has been hand-optimized so as to reduce CPU use
   while retaining quality.
   Catalog of stars is built into the TGLSkyDome, but constellations are rendered
   via a TGLLines, which is filled in the LoadConstLines method.
*)
program Litosfera;



uses
  Forms,
  flOptions in '..\source\lito\flOptions.pas' {frmOptions},
  fmForm in '..\source\fmForm.pas' {FormI},
  dmImages in '..\source\dmImages.pas' {DataModuleImages: TDataModule},
  flLitosfera in '..\source\lito\flLitosfera.pas' {frmLitosfera},
  Space.Globals in '..\source\Space.Globals.pas',
  fmAbout in '..\source\fmAbout.pas' {FormAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmLitosfera, frmLitosfera);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TFormAbout, FormAbout);
  Application.Run;
end.
