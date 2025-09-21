unit fbSettings_ru;

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
  TFormSettings = class(TForm)
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
    fUserSettings: TUserSettings;
  public
    property UserSettings: TUserSettings read fUserSettings write fUserSettings;
  end;

var
  FormSettings: TFormSettings;

implementation //=============================================================

uses
  fbFirstForm_ru;

{$R *.dfm}

procedure TFormSettings.FormShow(Sender: TObject);
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

procedure TFormSettings.cbLoadOnStartupClick(Sender: TObject);
begin
  UserSettings.LoadOnStartup := cbLoadOnStartup.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbAutosaveClick(Sender: TObject);
begin
  UserSettings.AutoSave := cbAutosave.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbSplashStartClick(Sender: TObject);
begin
  UserSettings.SplashStart := cbSplashStart.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbSplashExitClick(Sender: TObject);
begin
  UserSettings.SplashExit := cbSplashExit.Checked;
  UserSettings.SaveToRegistry;
  if UserSettings.SplashExit then
    FormFirst.ShowTimer.Interval := 1500
  else
    FormFirst.ShowTimer.Interval := 1;
end;

procedure TFormSettings.cbInvertMouseClick(Sender: TObject);
begin
  UserSettings.InvertMouse := cbInvertMouse.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbInvertPlanetClick(Sender: TObject);
begin
  UserSettings.InvertPlanet := cbInvertPlanet.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbAuto3DViewClick(Sender: TObject);
begin
  UserSettings.Auto3DView := cbAuto3DView.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbInvertMouseWheelClick(Sender: TObject);
begin
  UserSettings.InvertMouseWheel := cbInvertMouseWheel.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbTipOfTheDayClick(Sender: TObject);
begin
  UserSettings.TipOfTheDay := cbTipOfTheDay.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbRememberViewClick(Sender: TObject);
begin
  UserSettings.RememberView := cbRememberView.Checked;
  UserSettings.SaveToRegistry;
end;

procedure TFormSettings.cbAdvancedModeClick(Sender: TObject);
begin
  UserSettings.AdvancedMode := cbAdvancedMode.Checked;
  UserSettings.SaveToRegistry;
  FormFirst.RealityForm.RefreshInterface;
end;

end.
