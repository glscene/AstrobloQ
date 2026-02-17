object Main: TMain
  Left = 238
  Top = 135
  BorderIcons = [biSystemMenu]
  Caption = 'Bump Smoke'
  ClientHeight = 490
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    705
    490)
  TextHeight = 13
  object SceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 705
    Height = 490
    Camera = Cam
    Buffer.BackgroundColor = clBlack
    Buffer.Lighting = False
    Buffer.DepthPrecision = dp32bits
    Buffer.ColorDepth = cd24bits
    FieldOfView = 156.930755615234400000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object Button1: TButton
    Left = 626
    Top = 8
    Width = 81
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Start'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 618
  end
  object Scene: TGLScene
    Left = 8
    Top = 8
    object DummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Cube1: TGLCube
        Material.MaterialLibrary = tlp
        Visible = False
        CubeSize = {000020410000204100002041}
      end
      object Cube2: TGLCube
        Material.MaterialLibrary = tlp
        Visible = False
        CubeSize = {000020410000204100002041}
      end
      object Sphere1: TGLSphere
        Material.MaterialLibrary = tlp
        Radius = 5.000000000000000000
      end
      object Sphere2: TGLSphere
        Material.MaterialLibrary = tlp
        Radius = 5.000000000000000000
      end
    end
    object hsp: TGLHUDSprite
      Material.MaterialLibrary = tlp
      Position.Coordinates = {00008C4200008C42000000000000803F}
      Width = 128.000000000000000000
      Height = 128.000000000000000000
      Rotation = 0.000000000000000000
    end
    object Cam: TGLCamera
      DepthOfView = 1000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = Cube1
      Position.Coordinates = {00000C4200007041000000000000803F}
      Left = 232
      Top = 152
    end
  end
  object Tick: TGLCadencer
    Scene = Scene
    OnProgress = TickProgress
    Left = 40
    Top = 8
  end
  object tlp: TGLMaterialLibrary
    Left = 72
    Top = 8
  end
  object AsyncTimer1: TGLAsyncTimer
    Enabled = True
    OnTimer = AsyncTimer1Timer
    ThreadPriority = tpNormal
    Left = 8
    Top = 40
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = SceneViewer
    FormCaption = 'Bump Smoke - %FPS'
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
    Left = 184
    Top = 48
  end
end
