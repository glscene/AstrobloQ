object FormAstrodron: TFormAstrodron
  Left = 193
  Top = 105
  Caption = 'Astrodron'
  ClientHeight = 474
  ClientWidth = 711
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
    Left = 224
    Top = 72
    Width = 28
    Height = 28
    AutoSize = True
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 596
    Height = 474
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 156.173950195312500000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 596
    Top = 0
    Width = 115
    Height = 474
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 588
    ExplicitHeight = 447
    object RadioGroup1: TRadioGroup
      Left = 16
      Top = 16
      Width = 89
      Height = 105
      Caption = 'Stars'
      ItemIndex = 0
      Items.Strings = (
        'White'
        'Colorized'
        'Spectral')
      TabOrder = 0
    end
    object RadioGroup2: TRadioGroup
      Left = 16
      Top = 144
      Width = 89
      Height = 105
      Caption = 'Galaxies'
      ItemIndex = 0
      Items.Strings = (
        '0 %'
        '50 %'
        '100 %')
      TabOrder = 1
    end
  end
  object GLScene1: TGLScene
    Left = 40
    Top = 16
    object GLSkyDome1: TGLSkyDome
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Stacks = 4
        end>
      Stars = <>
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLCamera1: TGLCamera
        DepthOfView = 100.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = GLDummyCube1
        Position.Coordinates = {0000000000000000000048C20000803F}
      end
      object GLLightSource1: TGLLightSource
        Ambient.Color = {0000803F0000803F0000803F0000803F}
        ConstAttenuation = 1.000000000000000000
        Position.Coordinates = {000000000000003F000000000000803F}
        SpotCutOff = 180.000000000000000000
      end
      object GLXYZGrid1: TGLXYZGrid
        Direction.Coordinates = {00000000F304353FF304353F00000000}
        PitchAngle = 45.000000000000000000
        Up.Coordinates = {00000000F304353FF30435BF00000000}
        Visible = False
        XSamplingScale.Max = 9.000000000000000000
        XSamplingScale.Step = 0.500000000000000000
        YSamplingScale.Max = 9.000000000000000000
        YSamplingScale.Step = 0.500000000000000000
        ZSamplingScale.Step = 0.100000001490116100
      end
    end
  end
  object GLMaterialLibrary1: TGLMaterialLibrary
    Materials = <
      item
        Name = 'LibMaterial'
        Tag = 0
        Material.BackProperties.Ambient.Color = {00000000000000000000000000000000}
        Material.BackProperties.Diffuse.Color = {00000000000000000000000000000000}
        Material.BackProperties.Emission.Color = {00000000000000000000000000000000}
        Material.BackProperties.Specular.Color = {00000000000000000000000000000000}
        Material.FrontProperties.Ambient.Color = {00000000000000000000000000000000}
        Material.FrontProperties.Diffuse.Color = {00000000000000000000000000000000}
        Material.FrontProperties.Emission.Color = {00000000000000000000000000000000}
        Material.FrontProperties.Specular.Color = {00000000000000000000000000000000}
        Material.BlendingMode = bmTransparency
        Material.Texture.ImageAlpha = tiaTopLeftPointColorTransparent
        Material.Texture.TextureMode = tmReplace
        Material.Texture.Disabled = False
      end>
    Left = 112
    Top = 16
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 200
    Top = 16
  end
end
