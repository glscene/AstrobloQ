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
  object SolvingViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 818
    Height = 579
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = GLCameraSol
    Buffer.BackgroundColor = clBlack
    FieldOfView = 160.402053833007800000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLSceneSolvings: TGLScene
    Left = 120
    Top = 64
    object GLLightSourceSol: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      SpotCutOff = 180.000000000000000000
      object GLCameraSol: TGLCamera
        DepthOfView = 10000.000000000000000000
        FocalLength = 50.000000000000000000
        TargetObject = GLDummyCubeSol
        CameraStyle = csInfinitePerspective
        Position.Coordinates = {0000004000000000000000400000803F}
        object GLLightSource1: TGLLightSource
          ConstAttenuation = 1.000000000000000000
          SpotCutOff = 180.000000000000000000
        end
      end
    end
    object GLDummyCubeSol: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLSphereSol: TGLSphere
        Material.FrontProperties.Ambient.Color = {0000000000000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {000000000000003F000000000000803F}
        Radius = 0.500000000000000000
      end
    end
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = SolvingViewer
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
