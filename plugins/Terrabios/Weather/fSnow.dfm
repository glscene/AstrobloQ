object FormSnow: TFormSnow
  Left = 189
  Top = 161
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = 'FormSnow'
  ClientHeight = 600
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 797
    Height = 600
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    Buffer.DepthTest = False
    FieldOfView = 161.075363159179700000
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
