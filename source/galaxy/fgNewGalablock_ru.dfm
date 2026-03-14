object frmNewStarblock: TfrmNewStarblock
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1075#1072#1083#1072#1073#1083#1086#1082
  ClientHeight = 633
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PanelRight: TPanel
    Left = 799
    Top = 0
    Width = 247
    Height = 633
    Align = alRight
    Caption = 'PanelRight'
    ShowCaption = False
    TabOrder = 0
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 799
    Height = 633
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 162.045455932617200000
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
  end
  object GLScene1: TGLScene
    Left = 176
    Top = 104
    object Camera: TGLCamera
      DepthOfView = 10000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = dcStarblock
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {00007A440080BB4400007A440000803F}
      object LightSource: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        Position.Coordinates = {0000000000000000000048430000803F}
        SpotCutOff = 180.000000000000000000
      end
    end
    object dcStarblock: TGLDummyCube
      CubeSize = 1000.000000000000000000
      object сubeStarblock: TGLCube
        Material.PolygonMode = pmLines
        CubeSize = {00007A4400007A4400007A44}
        object pntCube: TGLPoints
          NoZWrite = False
          Static = False
        end
        object pntStars: TGLPoints
          NoZWrite = False
          Static = False
        end
      end
      object sphereStarblock: TGLSphere
        Material.PolygonMode = pmLines
        Visible = False
        Radius = 866.000000000000000000
        Slices = 64
        Stacks = 64
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Left = 176
    Top = 176
  end
  object GLAsyncTimer1: TGLAsyncTimer
    Left = 312
    Top = 104
  end
  object Timer1: TTimer
    Left = 640
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 552
    Top = 112
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object miSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      end
    end
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = #1053#1086#1074#1099#1081' '#1089#1090#1072#1088#1073#1083#1086#1082' - %FPS'
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
    Left = 312
    Top = 184
  end
end
