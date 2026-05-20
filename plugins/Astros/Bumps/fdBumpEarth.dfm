object FBumpEarth: TFBumpEarth
  Left = 265
  Top = 103
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = 'GLSL BumpEarth'
  ClientHeight = 548
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnResize = FormResize
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 780
    Height = 548
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 30.645940780639650000
    PenAsTouch = False
    Align = alClient
    PopupMenu = PopupMenu
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
    ExplicitWidth = 772
    ExplicitHeight = 523
  end
  object GLScene1: TGLScene
    Left = 16
    Top = 16
    object GLLightSource2: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000A0C00000A0C00000A0C00000803F}
      SpotCutOff = 180.000000000000000000
      SpotDirection.Coordinates = {00000000000080BF0000000000000000}
    end
    object DOInitialize: TGLDirectOpenGL
      UseBuildList = False
      OnRender = DOInitializeRender
      Blend = False
    end
    object DORender: TGLDirectOpenGL
      UseBuildList = False
      OnRender = DORenderRender
      Blend = False
    end
    object GLCamera1: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 1000.000000000000000000
      TargetObject = DORender
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {0000E0C00000A040000000000000803F}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        Position.Coordinates = {0000000000000000000070410000803F}
        SpotCutOff = 180.000000000000000000
      end
    end
  end
  object MatLib: TGLMaterialLibrary
    Materials = <
      item
        Name = 'decal'
        Tag = 0
        Material.Texture.ImageClassName = 'TGLPicFileImage'
        Material.Texture.Image.PictureFileName = 'earth.jpg'
        Material.Texture.TextureMode = tmReplace
        Material.Texture.TextureWrap = twNone
        Material.Texture.Disabled = False
      end
      item
        Name = 'heightmap'
        Tag = 0
        Material.Texture.ImageClassName = 'TGLPicFileImage'
        Material.Texture.Image.PictureFileName = 'earth_bump.bmp'
        Material.Texture.TextureMode = tmReplace
        Material.Texture.TextureWrap = twNone
        Material.Texture.TextureFormat = tfIntensity
        Material.Texture.Disabled = False
      end
      item
        Name = 'normalmap'
        Tag = 0
        Material.Texture.ImageClassName = 'TGLPicFileImage'
        Material.Texture.Image.PictureFileName = 'earth_bump.bmp'
        Material.Texture.TextureMode = tmReplace
        Material.Texture.TextureWrap = twNone
        Material.Texture.TextureFormat = tfRGB
        Material.Texture.Disabled = False
        Material.Texture.NormalMapScale = 0.050000000745058060
      end>
    Left = 56
    Top = 16
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 112
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 144
    Top = 16
  end
  object PopupMenu: TPopupMenu
    Left = 24
    Top = 104
    object MIDot3: TMenuItem
      AutoCheck = True
      Caption = 'DOT3 BumpMapping'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = MIDot3Click
    end
    object MIParallax: TMenuItem
      AutoCheck = True
      Caption = 'Parallax Bump Mapping'
      GroupIndex = 1
      RadioItem = True
      OnClick = MIParallaxClick
    end
    object N1: TMenuItem
      Caption = '-'
      GroupIndex = 1
    end
    object miWireFrame: TMenuItem
      AutoCheck = True
      Caption = 'Wireframe'
      GroupIndex = 1
    end
  end
end
