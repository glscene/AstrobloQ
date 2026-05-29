(****************************************************************************
                           AstrobloQ System
*****************************************************************************)
program Nooneta_ru;

uses
  Forms,
  fnNooneta_ru in '..\source\noo\ru\fnNooneta_ru.pas' {FormTerraNavi};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormTerraNavi, FormTerraNavi);
  Application.Run;
end.
