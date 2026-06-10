object frmConnector: TfrmConnector
  Left = 192
  Top = 106
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = 'Space link'
  ClientHeight = 561
  ClientWidth = 854
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 13
  object GLSceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 854
    Height = 561
    Camera = Camera
    Buffer.BackgroundColor = clTeal
    FieldOfView = 159.786010742187500000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewerMouseDown
    OnMouseMove = GLSceneViewerMouseMove
    OnMouseUp = GLSceneViewerMouseUp
    TabOrder = 0
  end
  object GLScene: TGLScene
    Left = 80
    Top = 8
    object DummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object GLCube1: TGLCube
        Position.Coordinates = {0000804000000000000000000000803F}
        CubeSize = {000000409A99993E00000041}
      end
      object GLCube2: TGLCube
        Position.Coordinates = {000080C000000000000000000000803F}
        CubeSize = {000000409A99993E00000041}
      end
      object c11: TGLCube
        Position.Coordinates = {00004040000000000000803F0000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object c12: TGLCube
        Position.Coordinates = {0000404000000000000000000000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object c13: TGLCube
        Position.Coordinates = {0000404000000000000080BF0000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object c21: TGLCube
        Position.Coordinates = {000040C0000000000000803F0000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object c22: TGLCube
        Position.Coordinates = {000040C000000000000000000000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object c23: TGLCube
        Position.Coordinates = {000040C000000000000080BF0000803F}
        CubeSize = {0000003F0000003F0000003F}
      end
      object GLSphere1: TGLSphere
        Radius = 0.500000000000000000
        Slices = 16
        Stacks = 16
      end
    end
    object Lines: TGLLines
      LineColor.Color = {9A93133FEBE0E03EE4DB5B3F0000803F}
      LineWidth = 2.000000000000000000
      Nodes = <
        item
        end
        item
        end>
      NodesAspect = lnaInvisible
      Options = []
    end
    object Camera: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = DummyCube
      Position.Coordinates = {000080400000A0400000C0400000803F}
      object light: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    FixedDeltaTime = 0.020000000000000000
    Mode = cmApplicationIdle
    SleepLength = 1
    OnProgress = GLCadencerProgress
    Left = 184
    Top = 8
  end
end
