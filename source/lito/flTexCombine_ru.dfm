object frmTexCombine: TfrmTexCombine
  Left = 117
  Top = 103
  Caption = #1054#1073#1098#1077#1076#1080#1085#1077#1085#1080#1077' '#1090#1077#1082#1089#1090#1091#1088
  ClientHeight = 422
  ClientWidth = 589
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 82
    Width = 282
    Height = 128
    Stretch = True
  end
  object Image2: TImage
    Left = 298
    Top = 82
    Width = 269
    Height = 128
    Stretch = True
  end
  object Label1: TLabel
    Left = 7
    Top = 15
    Width = 77
    Height = 19
    Caption = #1058#1077#1082#1089#1090#1091#1088#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 175
    Top = 3
    Width = 115
    Height = 13
    Caption = 'Texture Combiners code'
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 67
    Height = 13
    Caption = 'Primary Color :'
  end
  object SceneViewer: TGLSceneViewer
    Left = 8
    Top = 216
    Width = 565
    Height = 199
    Camera = GLCamera
    PostRender = SceneViewerPostRender
    Buffer.BackgroundColor = clGray
    Buffer.Lighting = False
    FieldOfView = 126.639793395996100000
    PenAsTouch = False
    TabOrder = 0
  end
  object BUApply: TButton
    Left = 138
    Top = 33
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 1
    OnClick = BUApplyClick
  end
  object PATex1: TPanel
    Left = 360
    Top = 124
    Width = 81
    Height = 41
    BevelOuter = bvLowered
    Caption = 'Unavailable'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8421440
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
  end
  object CBTex0: TCheckBox
    Left = 8
    Top = 64
    Width = 57
    Height = 16
    Caption = 'Tex0'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CBTex0Click
  end
  object CBTex1: TCheckBox
    Left = 152
    Top = 64
    Width = 73
    Height = 16
    Caption = 'Tex1'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = CBTex0Click
  end
  object Panel1: TPanel
    Left = 296
    Top = 3
    Width = 273
    Height = 73
    BevelOuter = bvLowered
    BorderWidth = 1
    Caption = 'Panel1'
    TabOrder = 5
    object MECombiner: TMemo
      Left = 2
      Top = 2
      Width = 269
      Height = 69
      Hint = 
        'Syntax Examples:'#13#10#13#10'   Tex1:=Tex0;   // replace texture 1 with t' +
        'exture 0'#13#10'   Tex1:=Tex0+Tex1; // additive blending between textu' +
        'res 0 and 1'#13#10'   Tex1:=Tex0-Tex1; // subtractive blending between' +
        ' textures 0 and 1'#13#10'   Tex1:=Tex0*Tex1; // modulation between tex' +
        'tures 0 and 1'#13#10'   Tex1:=Tex0+Tex1-0.5; // signed additive blendi' +
        'ng between textures 0 and 1'#13#10'   Tex1:=Interpolate(Tex0, Tex1, Pr' +
        'imaryColor); // interpolation between textures 0 and 1 using pri' +
        'mary color as factor'#13#10'   Tex1:=Dot3(Tex0, Tex1); // dot3 product' +
        ' between textures 0 and 1'
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'Tex0:=Tex0;'
        'Tex1:=Tex0+Tex1;')
      ParentFont = False
      ParentShowHint = False
      ScrollBars = ssBoth
      ShowHint = True
      TabOrder = 0
    end
  end
  object PAPrimary: TPanel
    Left = 81
    Top = 38
    Width = 24
    Height = 17
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    OnClick = PAPrimaryClick
    OnDblClick = PAPrimaryClick
  end
  object GLScene: TGLScene
    Left = 400
    Top = 31
    object GLDummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object GLCamera: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube
      Position.Coordinates = {00000000000000000000A0400000803F}
    end
    object GLPlane: TGLPlane
      Material.MaterialLibrary = GLMaterialLibrary
      Material.LibMaterialName = 'Tex0'
      Height = 3.000000000000000000
      Width = 6.000000000000000000
    end
  end
  object GLMaterialLibrary: TGLMaterialLibrary
    Materials = <
      item
        Name = 'Tex0'
        Tag = 0
        Material.Texture.TextureMode = tmModulate
        Material.Texture.Disabled = False
        Texture2Name = 'Tex1'
        Shader = GLTexCombineShader
      end
      item
        Name = 'Tex1'
        Tag = 0
        Material.Texture.TextureMode = tmModulate
        Material.Texture.Disabled = False
      end
      item
        Name = 'Tex2'
        Tag = 0
      end
      item
        Name = 'Tex3'
        Tag = 0
      end>
    Left = 80
    Top = 124
  end
  object GLTexCombineShader: TGLTexCombineShader
    DesignTimeEnabled = False
    MaterialLibrary = GLMaterialLibrary
    LibMaterial3Name = 'Tex2'
    LibMaterial4Name = 'Tex3'
    Left = 164
    Top = 123
  end
  object ColorDialog: TColorDialog
    Options = [cdFullOpen, cdSolidColor, cdAnyColor]
    Left = 184
    Top = 16
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = SceneViewer
    FormCaption = 'Texure Combine - %FPS'
    KeyCombinations = <
      item
        ShiftState = [ssLeft, ssRight]
        Action = snaZoom
      end
      item
        ShiftState = [ssLeft]
        Action = snaMoveAroundTarget
      end
      item
        ShiftState = [ssRight]
        Action = snaMoveAroundTarget
      end>
    Left = 81
    Top = 276
  end
end
