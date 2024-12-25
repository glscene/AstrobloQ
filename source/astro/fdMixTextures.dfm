object FormTexCombine: TFormTexCombine
  Left = 117
  Top = 103
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Texure Combine'
  ClientHeight = 739
  ClientWidth = 1031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 24
  object Image1: TImage
    Left = 14
    Top = 144
    Width = 494
    Height = 224
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Stretch = True
  end
  object Image2: TImage
    Left = 522
    Top = 144
    Width = 470
    Height = 224
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Stretch = True
  end
  object Label1: TLabel
    Left = 12
    Top = 26
    Width = 124
    Height = 35
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Textures'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -30
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 306
    Top = 5
    Width = 210
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Texture Combiners code'
  end
  object Label2: TLabel
    Left = 14
    Top = 70
    Width = 123
    Height = 24
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Primary Color :'
  end
  object SceneViewer: TGLSceneViewer
    Left = 14
    Top = 378
    Width = 989
    Height = 348
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCamera
    PostRender = SceneViewerPostRender
    Buffer.BackgroundColor = clGray
    Buffer.Lighting = False
    FieldOfView = 147.935317993164100000
    PenAsTouch = False
    TabOrder = 0
  end
  object BUApply: TButton
    Left = 242
    Top = 58
    Width = 131
    Height = 44
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Apply'
    TabOrder = 1
    OnClick = BUApplyClick
  end
  object PATex1: TPanel
    Left = 630
    Top = 217
    Width = 142
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    BevelOuter = bvLowered
    Caption = 'Unavailable'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8421440
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 2
  end
  object CBTex0: TCheckBox
    Left = 14
    Top = 112
    Width = 100
    Height = 28
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Tex0'
    Checked = True
    State = cbChecked
    TabOrder = 3
    OnClick = CBTex0Click
  end
  object CBTex1: TCheckBox
    Left = 266
    Top = 112
    Width = 128
    Height = 28
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Tex1'
    Checked = True
    State = cbChecked
    TabOrder = 4
    OnClick = CBTex0Click
  end
  object Panel1: TPanel
    Left = 518
    Top = 5
    Width = 478
    Height = 128
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    BevelOuter = bvLowered
    BorderWidth = 1
    Caption = 'Panel1'
    TabOrder = 5
    object MECombiner: TMemo
      Left = 2
      Top = 2
      Width = 474
      Height = 124
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
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
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
    Left = 142
    Top = 67
    Width = 42
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
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
