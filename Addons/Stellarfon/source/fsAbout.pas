unit fsAbout;

// The unit is part of the AstrobloQ

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  Winapi.OpenGL,
  Winapi.OpenGLext,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.jpeg,
  Vcl.Imaging.pngimage,
  Vcl.ComCtrls,
  //
  GLS.OpenGLAdapter,
  GLS.Cadencer,
  GLS.FileMP3,
  GLSL.AsmShader,
  GLSL.PhongShader,
  GLS.SoundManager,
  GLS.Sounds.FMOD,
  GLS.Material,
  GLS.Context,


  GLSL.CustomShader,
  GLSL.Shader,
  GLS.BitmapFont,
  GLS.WindowsFont,
  GLS.SpaceText,
  GLS.Objects,
  GLS.HUDObjects,
  GLS.Scene,
  GLS.Coordinates,
  GLS.BaseClasses,
  GLS.SceneViewer;

type
  TFormAbout = class(TForm)
    PanelStellarfon: TPanel;
    PageControl: TPageControl;
    tsDevelopers: TTabSheet;
    tsOpenGL: TTabSheet;
    Viewer: TGLSceneViewer;
    Scene: TGLScene;
    SphereSound: TGLSphere;
    DCCameras: TGLDummyCube;
    Camera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    Background: TGLDummyCube;
    GLPlane1: TGLPlane;
    DriverInfo: TGLDummyCube;
    HUDText_Vendor: TGLResolutionIndependantHUDText;
    HUDText_Renderer: TGLResolutionIndependantHUDText;
    HUDText_Version: TGLResolutionIndependantHUDText;
    HUDText_ExtVersion: TGLResolutionIndependantHUDText;
    HUDText_GLSLVersion: TGLResolutionIndependantHUDText;
    HUDText_NBExt: TGLResolutionIndependantHUDText;
    HUDText_Counter: TGLResolutionIndependantHUDText;
    HUDExtensions: TGLDirectOpenGL;
    ForeGround: TGLDummyCube;
    HUDLogo: TGLHUDSprite;
    Extra: TGLDummyCube;
    HUDHelp: TGLResolutionIndependantHUDText;
    GLSpaceText1: TGLSpaceText;
    Cadencer: TGLCadencer;
    MaterialLibrary: TGLMaterialLibrary;
    WindowsBitmapFont: TGLWindowsBitmapFont;
    GLSLShader1: TGLSLShader;
    SoundLibrary: TGLSoundLibrary;
    FMODPlayer: TGLSMFMOD;
    Timer1: TTimer;
    GLPhongShader1: TGLPhongShader;
    WindowsBitmapFont2: TGLWindowsBitmapFont;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    procedure imgGeoblockDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BuiltWithDelphiDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Path: TFileName;
    VendorName: String;
    RendererName: String;
    RendererVersion: String;
    ExtensionVersion: String;
    GLSLVersion: String;
    NBExtensions: String;
    ExtensionsList: TStrings;
    StartLine, MaxLines: Integer;
    function GetFileInfo(const FileName: TFileName): TVSFixedFileInfo;
    function ReadVersionInfo(FileName: TFileName): TFileName;
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  // Memo.Align := alClient;
  //StaticTextVersion.Caption := ReadVersionInfo(ParamStr(0));

  Path := ExtractFilePath(ParamStr(0)) + 'data\audio';
  SetCurrentDir(Path);
  SoundLibrary.Samples.AddFile('intro.mp3', 'Music');
  if FMODPlayer <> ActiveSoundManager then
  begin
    // shut down current one, and activate the new one
    if ActiveSoundManager <> nil then
      ActiveSoundManager.Active := False;
    if FMODPlayer <> nil then
      FMODPlayer.Active := True;
    // restart sound
    if PageControl.ActivePageIndex = 2 then
      GetOrCreateSoundEmitter(SphereSound).Playing := True;
  end;

end;


procedure TFormAbout.FormShow(Sender: TObject);
var
  ExtStr: String;
  i: Integer;
  dc: HDC;
begin
  HUDLogo.Position.X := Viewer.Width - 150;
  HUDLogo.Position.Y := Viewer.Height - 100;
  Viewer.Buffer.RenderingContext.Activate;
  try
    with Viewer.Buffer do
    begin
      VendorName := String(glGetString(GL_VENDOR));
      RendererName := String(glGetString(GL_RENDERER));
      RendererVersion := String(glGetString(GL_VERSION));
      ExtensionVersion := String(glGetString(GL_SHADING_LANGUAGE_VERSION_ARB));
      GLSLVersion := '#' + IntToStr(GL_VERSION);
      ExtensionsList := TStringList.Create;
      ExtStr := String(glGetString(GL_EXTENSIONS));
      ExtensionsList.Clear;
      while Length(ExtStr) > 0 do
      begin
        i := Pos(' ', ExtStr);
        if i = 0 then
          i := 255;
        ExtensionsList.Add(Copy(ExtStr, 1, i - 1));
        Delete(ExtStr, 1, i);
      end;
      // Include WGL extensions
      if GL.W_ARB_extensions_string then
      begin
        dc := wglGetCurrentDC();
        ExtStr := String(GL.WGetExtensionsStringARB(dc));
        while Length(ExtStr) > 0 do
        begin
          i := Pos(' ', ExtStr);
          if i = 0 then
            i := 255;
          ExtensionsList.Add(Copy(ExtStr, 1, i - 1));
          Delete(ExtStr, 1, i);
        end;
      end;
      NBExtensions := IntToStr(ExtensionsList.Count);
    end;
  finally
    HUDText_Vendor.Text := 'Vendor             : ' + VendorName;
    HUDText_Renderer.Text := 'Renderer           : ' + RendererName;
    HUDText_Version.Text := 'Версия Renderer     : ' + RendererVersion;
    HUDText_ExtVersion.Text := 'Версия OPENGL     : ' + ExtensionVersion;
    HUDText_GLSLVersion.Text := 'Версия GLSL       : ' + GLSLVersion;
    HUDText_NBExt.Text := 'Поддержка расширений: ' + NBExtensions;
  end;
  MaxLines := round(((Viewer.Height - 30) - (Viewer.Height / 3)) / 12);
  StartLine := 0;
  Viewer.Invalidate;

end;

procedure GotoURL(Handle: integer; const URL: string);
var
  S: array[0..255] of char;
begin
  ShellExecute(Handle, 'Open', StrPCopy(S, URL), nil, nil, SW_SHOW);
end;


procedure TFormAbout.BuiltWithDelphiDblClick(Sender: TObject);
begin
  inherited;
  GotoURL(Handle, 'https://github.com/embarcadero');
end;

function TFormAbout.GetFileInfo(const FileName: TFileName): TVSFixedFileInfo;
var
  Handle, VersionSize: DWord;
  SubBlock: string;
  Temp:     Pointer;
  Data:     Pointer;
begin
  SubBlock    := '\';
  VersionSize := GetFileVersionInfoSize(PChar(FileName), Handle);
  if VersionSize > 0 then
  begin
    GetMem(Temp, VersionSize);
    try
      if GetFileVersionInfo(PChar(FileName), Handle, VersionSize, Temp) then
        if VerQueryValue(Temp, PChar(SubBlock), Data, VersionSize) then
          Result := PVSFixedFileInfo(Data)^;
    finally
      FreeMem(Temp);
    end;
  end;
end;

procedure TFormAbout.imgGeoblockDblClick(Sender: TObject);
begin
  GotoURL(Handle, 'https://github.com/geoblock');
end;

function TFormAbout.ReadVersionInfo(FileName: TFileName): TFileName;
type
  TGetWords = record
    case boolean of
      True: (C: cardinal);
      False: (Lo, Hi: word);
  end;
var
  VerSize, Wnd: cardinal;
  Buf, Value: Pointer;
  MS, LS: TGetWords;
begin
  VerSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if VerSize > 0 then
  begin
    GetMem(Buf, VerSize);
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerSize, Buf);

    VerQueryValue(Buf, '\', Value, VerSize);
    with TVSFixedFileInfo(Value^) do
    begin
      MS.C   := dwFileVersionMS;
      LS.C   := dwProductVersionMS; // dwFileVersionLS;
      Result := Format('%d.%d  Build %d', [MS.Hi, MS.Lo, LS.Hi]);
    end;
    FreeMem(Buf);
  end
  else
    Result := 'Unknown'; // or LoadResString(@sUnknown);
end;

end.
