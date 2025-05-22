object FormColorwheel: TFormColorwheel
  Left = 0
  Top = 0
  Caption = 'Colorwheels'
  ClientHeight = 443
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 622
    Height = 443
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 140.283218383789100000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 98
    Top = 70
    object GLLightSource1: TGLLightSource
      ConstAttenuation = 1.000000000000000000
      Position.Coordinates = {0000FA430000FA430000FA430000803F}
      SpotCutOff = 180.000000000000000000
    end
    object GLCamera1: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 80.000000000000000000
      TargetObject = GLDummyCube1
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {000000000000F0410000C8420000803F}
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 100.000000000000000000
      VisibleAtRunTime = True
      object GLIcosahedron1: TGLIcosahedron
        Scale.Coordinates = {0000C8420000C8420000C84200000000}
      end
    end
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = 'Colorwheel - %FPS'
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
    Left = 112
    Top = 266
  end
end
