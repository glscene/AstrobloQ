unit fbOptions;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Bio.UserSettings;

type
  TFormOptions = class(TForm)
    cbLoadOnStartup: TCheckBox;
    cbAutosave: TCheckBox;
    Label3: TLabel;
    panButtonBar: TPanel;
    panOKButton: TPanel;
    btnOK: TBitBtn;
    Label1: TLabel;
    cbSplashStart: TCheckBox;
    cbSplashExit: TCheckBox;
    cbInvertMouse: TCheckBox;
    Label2: TLabel;
    cbInvertPlanet: TCheckBox;
    cbAuto3DView: TCheckBox;
    cbInvertMouseWheel: TCheckBox;
    cbTipOfTheDay: TCheckBox;
    cbRememberView: TCheckBox;
    cbAdvancedMode: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cbLoadOnStartupClick(Sender: TObject);
    procedure cbAutosaveClick(Sender: TObject);
    procedure cbSplashStartClick(Sender: TObject);
    procedure cbSplashExitClick(Sender: TObject);
    procedure cbInvertMouseClick(Sender: TObject);
    procedure cbInvertPlanetClick(Sender: TObject);
    procedure cbAuto3DViewClick(Sender: TObject);
    procedure cbInvertMouseWheelClick(Sender: TObject);
    procedure cbTipOfTheDayClick(Sender: TObject);
    procedure cbRememberViewClick(Sender: TObject);
    procedure cbAdvancedModeClick(Sender: TObject);
  private
    fUserSettings: TaiUserSettings;
  public
    property UserSettings: TaiUserSettings read fUserSettings write fUserSettings;
  end;

var
  FormOptions: TFormOptions;

implementation //=============================================================

uses
  fbFirstForm;

{$R *.dfm}

procedure TFormOptions.FormShow(Sender: TObject);
begin
  cbLoadOnStartup.Checked := UserSettings.LoadOnStartup;
  cbAutosave.Checked := UserSettings.AutoSave;
  cbSplashStart.Checked := UserSettings.SplashStart;
  cbSplashExit.Checked := UserSettings.SplashExit;
  cbInvertMouse.Checked := UserSettings.InvertMouse;
  cbInvertPlanet.Checked := UserSettings.InvertPlanet;
  cbAuto3DView.Checked := UserSettings.Auto3DView;
  cbInvertMouseWheel.Checked := UserSettings.InvertMouseWheel;
  cbTipOfTheDay.Checked := UserSettings.TipOfTheDay;
  cbRememberView.Checked := UserSettings.RememberView;
  cbAdvancedMode.Checked := UserSettings.AdvancedMode;
end;

procedure TFormOptions.cbLoadOnStartupClick(Sender: TObject);
begin
  UserSettings.LoadOnStartup := cbLoadOnStartup.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbAutosaveClick(Sender: TObject);
begin
  UserSettings.AutoSave := cbAutosave.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbSplashStartClick(Sender: TObject);
begin
  UserSettings.SplashStart := cbSplashStart.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbSplashExitClick(Sender: TObject);
begin
  UserSettings.SplashExit := cbSplashExit.Checked;
  UserSettings.SaveToRegistry;
  if UserSettings.SplashExit then
    FormFirst.ShowTimer.Interval := 1500
  else
    FormFirst.ShowTimer.Interval := 1;
end;

procedure TFormOptions.cbInvertMouseClick(Sender: TObject);
begin
  UserSettings.InvertMouse := cbInvertMouse.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbInvertPlanetClick(Sender: TObject);
begin
  UserSettings.InvertPlanet := cbInvertPlanet.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbAuto3DViewClick(Sender: TObject);
begin
  UserSettings.Auto3DView := cbAuto3DView.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbInvertMouseWheelClick(Sender: TObject);
begin
  UserSettings.InvertMouseWheel := cbInvertMouseWheel.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbTipOfTheDayClick(Sender: TObject);
begin
  UserSettings.TipOfTheDay := cbTipOfTheDay.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbRememberViewClick(Sender: TObject);
begin
  UserSettings.RememberView := cbRememberView.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormOptions.cbAdvancedModeClick(Sender: TObject);
begin
  UserSettings.AdvancedMode := cbAdvancedMode.Checked;
  UserSettings.SaveToRegistry;
  FormFirst.RealityForm.RefreshInterface;
end;

end.
