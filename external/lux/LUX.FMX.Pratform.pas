unit LUX.FMX.Pratform;

interface

uses
  FMX.Platform;

function GetDisplayScale: Single;

implementation //=========================================

function GetDisplayScale: Single;
var
  S: IFMXScreenService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService,
    IInterface(S)) then
    Result := S.GetScreenScale
  else
    Result := 1;
end;

initialization //=====================

finalization

end.
