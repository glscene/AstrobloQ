object FormSnow: TFormSnow
  Left = 189
  Top = 161
  Margins.Left = 4
  Margins.Top = 4
  Margins.Right = 4
  Margins.Bottom = 4
  Caption = 'FormSnow'
  ClientHeight = 1050
  ClientWidth = 1394
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  PixelsPerInch = 168
  TextHeight = 24
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 1394
    Height = 1050
    Margins.Left = 6
    Margins.Top = 6
    Margins.Right = 6
    Margins.Bottom = 6
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    Buffer.DepthTest = False
    FieldOfView = 169.119338989257800000
    PenAsTouch = False
    Align = alClient
    OnMouseDown = GLSceneViewer1MouseDown
    OnMouseMove = GLSceneViewer1MouseMove
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 210
    Top = 26
    object GLDummyCube1: TGLDummyCube
      CubeSize = 10.000000000000000000
      EdgeColor.Color = {0000803FF8FEFE3E000000000000803F}
      VisibleAtRunTime = True
      object GLParticles1: TGLParticles
        ObjectsSorting = osNone
        Scale.Coordinates = {00000040000000400000004000000000}
        CubeSize = 1.000000000000000000
        OnActivateParticle = GLParticles1ActivateParticle
      end
      object GLSphere1: TGLSphere
        Material.FrontProperties.Ambient.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Emission.Color = {0000803F0000803F000000000000803F}
        Material.FrontProperties.Specular.Color = {0000803F0000803F000000000000803F}
        Radius = 2.000000000000000000
      end
    end
    object GLCamera1: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = GLParticles1
      Position.Coordinates = {0000F041000020410000A0410000803F}
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    SleepLength = 1
    Left = 210
    Top = 100
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 500
    Top = 26
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 500
    Top = 100
  end
end
