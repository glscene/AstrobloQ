unit Astro.Material;

interface

uses
  System.Classes,
  System.UITypes,
  System.Messaging,
  System.SysUtils,

  FMX.Types3D,
  FMX.Graphics,

  LUX.FMX.Material;

type
  TAstroMaterial = class(TLuxMaterial)
  private
  protected
    _MatrixLS: TShaderVarMatrix3D;
    _MatrixLG: TShaderVarMatrix3D;
    _MatrixGL: TShaderVarMatrix3D;
    _Light: TShaderVarLight;
    _EyePos: TShaderVarVector3D;
    _Opacity: TShaderVarSingle;
    _EmisLight: TShaderVarColorF;
    _AmbiLight: TShaderVarColorF;
    _DiffRatio: TShaderVarColorF;
    _SpecRatio: TShaderVarColorF;
    _SpecShiny: TShaderVarSingle;
    _DiffImage: TShaderVarTexture;
    procedure DoApply(const Context_: TContext3D); override;
  public
    constructor Create; override;
    destructor Destroy; override;
    property EmisLight: TShaderVarColorF read _EmisLight;
    property AmbiLight: TShaderVarColorF read _AmbiLight;
    property DiffRatio: TShaderVarColorF read _DiffRatio;
    property SpecRatio: TShaderVarColorF read _SpecRatio;
    property SpecShiny: TShaderVarSingle read _SpecShiny;
    property DiffImage: TShaderVarTexture read _DiffImage;
  end;

  TAstroMaterialSource = class(TLuxMaterialSource<TAstroMaterial>)
  private
    _ContextResetId: Integer;
    procedure ContextResetHandler(const Sender_: TObject; const Msg_: TMessage);
  protected
    _DiffImage: TBitmap;
    function GetEmisLight: TAlphaColorF;
    procedure SetEmisLight(const EmisLight_: TAlphaColorF);
    function GetAmbiLight: TAlphaColorF;
    procedure SetAmbiLight(const AmbiLight_: TAlphaColorF);
    function GetDiffRatio: TAlphaColorF;
    procedure SetDiffRatio(const DiffRatio_: TAlphaColorF);
    function GetSpecRatio: TAlphaColorF;
    procedure SetSpecRatio(const SpecRatio_: TAlphaColorF);
    function GetSpecShiny: Single;
    procedure SetSpecShiny(const SpecShiny_: Single);
    procedure SetDiffImage(const DiffImage_: TBitmap);
    procedure DoDiffImageChanged(Sender_: TObject);
  public
    constructor Create(Owner_: TComponent); override;
    destructor Destroy; override;
    property EmisLight: TAlphaColorF read GetEmisLight write SetEmisLight;
    property AmbiLight: TAlphaColorF read GetAmbiLight write SetAmbiLight;
    property DiffRatio: TAlphaColorF read GetDiffRatio write SetDiffRatio;
    property SpecRatio: TAlphaColorF read GetSpecRatio write SetSpecRatio;
    property SpecShiny: Single read GetSpecShiny write SetSpecShiny;
    property DiffImage: TBitmap read _DiffImage write SetDiffImage;
  end;

implementation //--------------------------------------------------------------


constructor TAstroMaterial.Create;
begin
  inherited;

  _MatrixLS := TShaderVarMatrix3D.Create('_MatrixLS');
  _MatrixLG := TShaderVarMatrix3D.Create('_MatrixLG');
  _MatrixGL := TShaderVarMatrix3D.Create('_MatrixGL');
  _Light := TShaderVarLight.Create('_Light');
  _EyePos := TShaderVarVector3D.Create('_EyePos');
  _Opacity := TShaderVarSingle.Create('_Opacity');
  _EmisLight := TShaderVarColorF.Create('_EmisLight');
  _AmbiLight := TShaderVarColorF.Create('_AmbiLight');
  _DiffRatio := TShaderVarColorF.Create('_DiffRatio');
  _SpecRatio := TShaderVarColorF.Create('_SpecRatio');
  _SpecShiny := TShaderVarSingle.Create('_SpecShiny');
  _DiffImage := TShaderVarTexture.Create('_DiffImage');

  _ShaderV.Vars := [_MatrixLS, _MatrixLG, _MatrixGL];

  _ShaderP.Vars := [_MatrixLS, _MatrixLG, _MatrixGL, _Light, _EyePos, _Opacity,
    _EmisLight, _AmbiLight, _DiffRatio, _SpecRatio, _SpecShiny, _DiffImage];

  _EmisLight.Value := TAlphaColorF.Create(0, 0, 0);
  _AmbiLight.Value := TAlphaColorF.Create(0.1, 0.1, 0.1);
  _DiffRatio.Value := TAlphaColorF.Create(1, 1, 1);
  _SpecRatio.Value := TAlphaColorF.Create(1, 1, 1);
  _SpecShiny.Value := 50;
end;

//---------------------------------------------------------------------------

procedure TAstroMaterial.DoApply(const Context_: TContext3D);
begin
  inherited;

  with Context_ do
  begin
    SetShaders(_ShaderV.Shader, _ShaderP.Shader);

    _MatrixLS.Value := CurrentModelViewProjectionMatrix;
    _MatrixLG.Value := CurrentMatrix;
    _MatrixGL.Value := CurrentMatrix.Inverse;
    _Light.Value := Lights[0];
    _EyePos.Value := CurrentCameraInvMatrix.M[3];
    _Opacity.Value := CurrentOpacity;
  end;

  _ShaderV.SendVars(Context_);
  _ShaderP.SendVars(Context_);
end;

//---------------------------------------------------------------------------

destructor TAstroMaterial.Destroy;
begin
  _MatrixLS.Free;
  _MatrixLG.Free;
  _MatrixGL.Free;
  _Light.Free;
  _EyePos.Free;
  _Opacity.Free;
  _EmisLight.Free;
  _AmbiLight.Free;
  _DiffRatio.Free;
  _SpecRatio.Free;
  _SpecShiny.Free;
  _DiffImage.Free;

  inherited;
end;

procedure TAstroMaterialSource.ContextResetHandler(const Sender_: TObject;
  const Msg_: TMessage);
begin
  DoDiffImageChanged(Self);
end;

function TAstroMaterialSource.GetEmisLight: TAlphaColorF;
begin
  Result := _Material.EmisLight.Value;
end;

procedure TAstroMaterialSource.SetEmisLight(const EmisLight_: TAlphaColorF);
begin
  _Material.EmisLight.Value := EmisLight_;
end;

function TAstroMaterialSource.GetAmbiLight: TAlphaColorF;
begin
  Result := _Material.AmbiLight.Value;
end;

procedure TAstroMaterialSource.SetAmbiLight(const AmbiLight_: TAlphaColorF);
begin
  _Material.AmbiLight.Value := AmbiLight_;
end;

function TAstroMaterialSource.GetDiffRatio: TAlphaColorF;
begin
  Result := _Material.DiffRatio.Value;
end;

procedure TAstroMaterialSource.SetDiffRatio(const DiffRatio_: TAlphaColorF);
begin
  _Material.DiffRatio.Value := DiffRatio_;
end;

function TAstroMaterialSource.GetSpecRatio: TAlphaColorF;
begin
  Result := _Material.SpecRatio.Value;
end;

procedure TAstroMaterialSource.SetSpecRatio(const SpecRatio_: TAlphaColorF);
begin
  _Material.SpecRatio.Value := SpecRatio_;
end;

function TAstroMaterialSource.GetSpecShiny: Single;
begin
  Result := _Material.SpecShiny.Value;
end;

procedure TAstroMaterialSource.SetSpecShiny(const SpecShiny_: Single);
begin
  _Material.SpecShiny.Value := SpecShiny_;
end;

procedure TAstroMaterialSource.SetDiffImage(const DiffImage_: TBitmap);
begin
  _DiffImage.Assign(DiffImage_);
end;

procedure TAstroMaterialSource.DoDiffImageChanged(Sender_: TObject);
begin
  if not _DiffImage.IsEmpty then
    _Material.DiffImage.Value := TTextureBitmap(_DiffImage).Texture;
end;

constructor TAstroMaterialSource.Create(Owner_: TComponent);
begin
  inherited;

  _ContextResetId := TMessageManager.DefaultManager.SubscribeToMessage
    (TContextResetMessage, ContextResetHandler);

  _DiffImage := TTextureBitmap.Create;

  _DiffImage.OnChange := DoDiffImageChanged;
end;

destructor TAstroMaterialSource.Destroy;
begin
  FreeAndNil(_DiffImage);

  TMessageManager.DefaultManager.Unsubscribe(TContextResetMessage,
    _ContextResetId);

  inherited;
end;

initialization //-------------------------------------------------------------

finalization //---------------------------------------------------------------

end.
