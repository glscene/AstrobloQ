program Graf3d;

uses
  Vcl.Forms,
  faGraf3d in 'source\astro\faGraf3d.pas' {FormGraf3d};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormGraf3d, FormGraf3d);
  Application.Run;
end.
