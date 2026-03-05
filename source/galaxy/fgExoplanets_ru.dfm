object frmOpenExoplanets: TfrmOpenExoplanets
  Left = 0
  Top = 0
  Caption = #1054#1090#1082#1088#1099#1090#1099#1077' '#1101#1082#1079#1086#1087#1083#1072#1085#1077#1090#1099
  ClientHeight = 446
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 715
    Height = 29
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 707
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 426
    Width = 715
    Height = 20
    Panels = <>
    ExplicitTop = 401
    ExplicitWidth = 707
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 29
    Width = 137
    Height = 397
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 372
    object tvStellarSystems: TTreeView
      Left = 1
      Top = 20
      Width = 135
      Height = 285
      Align = alTop
      Indent = 19
      TabOrder = 0
    end
    object stStellarSystem: TStaticText
      Left = 1
      Top = 1
      Width = 135
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Stellar system'
      TabOrder = 1
    end
  end
  object PanelRight: TPanel
    Left = 588
    Top = 29
    Width = 127
    Height = 397
    Align = alRight
    TabOrder = 3
    ExplicitLeft = 580
    ExplicitHeight = 372
    object tvExoplanets: TTreeView
      Left = 1
      Top = 20
      Width = 125
      Height = 285
      Align = alTop
      Indent = 19
      TabOrder = 0
    end
    object chbTerraplanets: TCheckBox
      Left = 24
      Top = 326
      Width = 97
      Height = 17
      Caption = 'Terraplanets'
      TabOrder = 1
    end
    object stExoplanets: TStaticText
      Left = 1
      Top = 1
      Width = 125
      Height = 19
      Align = alTop
      Alignment = taCenter
      Caption = 'Exoplanets'
      TabOrder = 2
    end
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 137
    Top = 29
    Width = 451
    Height = 397
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 151.723861694335900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 4
  end
  object GLScene: TGLScene
    Left = 336
    Top = 98
    object Camera: TGLCamera
      DepthOfView = 1000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = DummyCube
      CameraStyle = csInfinitePerspective
      object LightSource: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object DummyCube: TGLDummyCube
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
    end
  end
  object GLCadencer: TGLCadencer
    Left = 490
    Top = 98
  end
  object GLMaterialLibrary: TGLMaterialLibrary
    Left = 350
    Top = 252
  end
end
