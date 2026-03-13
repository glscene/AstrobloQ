object frmSolving: TfrmSolving
  Left = 0
  Top = 0
  Caption = #1056#1077#1097#1077#1085#1080#1077' '#1087#1072#1088#1072#1076#1086#1082#1089#1072' '#1060#1077#1088#1084#1080
  ClientHeight = 579
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object glsViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 818
    Height = 579
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 160.402053833007800000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene: TGLScene
    Left = 120
    Top = 64
    object GLSphere1: TGLSphere
      Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
      Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
      Radius = 0.500000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLDummyCube1
      Position.Coordinates = {0000004000000000000000400000803F}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = glsViewer
    FormCaption = #1056#1077#1097#1077#1085#1080#1077' '#1087#1072#1088#1072#1076#1086#1082#1089#1072' '#1060#1077#1088#1084#1080' - %FPS'
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
    Left = 256
    Top = 64
  end
end
