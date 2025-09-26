unit fbFirstForm_ru;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Imaging.Jpeg,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Imaging.GIFImg,

  vSplashScreen,
  Bio.UserSettings,
  Bio.Reality,

  fbReality_ru,
  fbConstruction_ru,
  fbNewReality_ru;

type
  TfrmFirst = class(TForm)
    ShowTimer: TTimer;
    imgSplash: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ShowTimerTimer(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    FRealityForm: TFormReality;
    FDetectedMonitors: integer;
    FMonitors: integer;
    FScreen: TScreen;
    FUserSettings: TaiUserSettings;
    FConstruction: TfrmConstruction;
    FErrorCount: integer;
  public
    property Screen: TScreen read FScreen;
    property DetectedMonitors: integer read FDetectedMonitors;
    property Monitors: integer read FMonitors write FMonitors;
    property UserSettings: TaiUserSettings read FUserSettings;
    property Construction: TfrmConstruction read FConstruction;
    property RealityForm: TFormReality read FRealityForm;
    function MultipleMonitors: boolean;
    procedure AppException(Sender: TObject; E: Exception);
    procedure ShowIntro;
    procedure ShowSplash;
  end;

var
  frmFirst: TfrmFirst;

implementation //--------------------------------------------------------------

uses
  fbIntro_ru,
  fbSplash_ru,
  fbError_ru,
  Bio.Things,
  Bio.Globals,
  fbAbout_ru;

{$R *.DFM}

procedure TfrmFirst.FormCreate(Sender: TObject);
begin
  FErrorCount := 0;
  Application.OnException := Self.AppException;
  SetCurrentDir(ExtractFilePath(ParamStr(0)));
  gVersion := 960;
  FConstruction := TfrmConstruction.Create(Self);
  Width := imgSplash.Picture.Bitmap.Width;
  Height := imgSplash.Picture.Bitmap.Height;
  SetWindowRgn(Handle, BitmapToRegion(imgSplash.Picture.Bitmap.Handle, clBlack, 10), True);
  FScreen := TScreen.Create(Self);
  FDetectedMonitors := Screen.MonitorCount;
  Monitors := DetectedMonitors;

  Construction.AddEvent('Число мониторов = ' + IntToStr(Monitors));
  FUserSettings := TaiUserSettings.Create;
  Construction.AddEvent('Загрузка установок...');
  UserSettings.LoadFromRegistry;
  Construction.AddEventSuccess(' сделано.');
(*
  if UserSettings.SplashStart then
    ShowSplash;
*)
  if UserSettings.SplashExit then
    ShowTimer.Interval := 1500
  else
    ShowTimer.Interval := 1;
  // create and go to reality form (goes to Manager Form, then Space Form)
  FRealityForm := TFormReality.Create(Self);
end;

procedure TfrmFirst.FormDestroy(Sender: TObject);
begin
  Construction.AddEvent('Сохранение установок...');
  UserSettings.SaveToRegistry;
  Construction.AddEventSuccess(' сделано.');

  FUserSettings.Free;
  FScreen.Free;

  Construction.AddEventSuccess('Пока! :)');
  FConstruction.Free;
end;

procedure TfrmFirst.FormShow(Sender: TObject);
var
  myFileName: string;
  myLoadTemp: boolean;
begin
  myFileName := '';
  myLoadTemp := false;
  SetCurrentDir(ExtractFilePath(ParamStr(0)));

  if ParamCount > 0 then
  begin
    if FileExists(ParamStr(1)) then
      myFileName := ParamStr(1);
  end
  else
    // check to see if load last planet on startup
    if UserSettings.LoadOnStartup then
    begin
      myFileName := UserSettings.WorkingFile;
      myLoadTemp := True;
      UserSettings.LoadOnStartup := false;
      UserSettings.SaveToRegistry;
    end;

  RealityForm.StartUp(myFileName);

  if myLoadTemp then
  begin
    UserSettings.LoadOnStartup := True;
    UserSettings.SaveToRegistry;
  end;

  RealityForm.ShowModal;

  while (RealityForm.ExitInstruction <> cInstructionExit) do
  begin
    case RealityForm.ExitInstruction of
      cInstructionLoadFile:
        begin
          myFileName := RealityForm.FileName;
          RealityForm.ShutDown;
          FRealityForm.Free;
          SetCurrentDir(ExtractFilePath(ParamStr(0)));
          FRealityForm := TFormReality.Create(Self);
          RealityForm.StartUp(myFileName);
          if myFileName = 'new.air' then
            RealityForm.StartReality
          else
            RealityForm.StopReality;
          RealityForm.ShowModal;
        end;
    end; // case
  end;

  RealityForm.ShutDown;
  FRealityForm.Free;

  ShowTimer.Enabled := True;
end;

procedure TfrmFirst.ShowIntro;
var
  FormIntro: TFormIntro;
begin
  FormIntro := TFormIntro.Create(Self);
  FormIntro.Monitors := Monitors;
  FormIntro.ShowModal;
  FormIntro.Free;
end;

procedure TfrmFirst.ShowSplash;
var
  mySplash: TFormSplash;
begin
  mySplash := TFormSplash.Create(Self);
  mySplash.ShowModal;
  mySplash.Refresh;
  mySplash.Free;
end;

function TfrmFirst.MultipleMonitors: boolean;
begin
  result := Monitors > 1;
end;

procedure TfrmFirst.ShowTimerTimer(Sender: TObject);
begin
  Close;
end;

procedure TfrmFirst.FormPaint(Sender: TObject);
begin
  Canvas.Draw(0, 0, imgSplash.Picture.Bitmap);
end;

procedure TfrmFirst.AppException(Sender: TObject; E: Exception);
var
  myFormError: TFormError;
  myAbout: TAboutInfo;
begin
  FErrorCount := FErrorCount + 1;
  if FErrorCount > 4 then
  begin
    halt;
    exit;
  end;
  if FErrorCount > 1 then
  begin
    Close;
    exit;
  end;

  RealityForm.RealityClock.Enabled := false;
  RealityForm.ManagerForm.SpaceForm.GLCadencer.Enabled := false;
  myFormError := TFormError.Create(Self);
  myAbout := TAboutInfo.Create(ParamStr(0));
  myFormError.Error := E;
  with myFormError.memReport.Lines do
  begin
    Clear;
    Add('Биосфера v' + myAbout.FileVersion);
    Add('');
    Add('Исключение: ' + E.ClassName);
    Add('Приложение: ' + ExtractFileName(ParamStr(0)) + '.');
    Add('Ошибка: ' + E.Message);
    Add('Реестр: ' + UserSettings.OneLineDisplay);
    Add('Конструкция-------');
    AddStrings(FConstruction.redStatus.Lines);
    RealityForm.Reality.Environment.Things.DisplayCounts(myFormError.memReport.Lines);
    Add('LastAction: ' + RealityForm.ManagerForm.SpaceForm.LastActivity + ' at ' +
      IntToStr(RealityForm.ManagerForm.SpaceForm.LastTime));
    // Add('3DView-----');
    // RealityForm.ManagerForm.SpaceForm.FullDisplay(myfmError.memReport.Lines);
  end;
  myAbout.Free;
  myFormError.ShowModal;
  myFormError.Free;
  RealityForm.ExitInstruction := cInstructionExit;
  RealityForm.Close;
end;

end.
