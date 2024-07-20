object FormTerranets: TFormTerranets
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Terranets'
  ClientHeight = 780
  ClientWidth = 1251
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 168
  TextHeight = 30
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 1251
    Height = 51
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    RowSize = 46
    TabOrder = 0
    ExplicitLeft = 266
    ExplicitTop = 98
    ExplicitWidth = 100
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 746
    Width = 1251
    Height = 34
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <>
    ExplicitTop = 594
    ExplicitWidth = 1076
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 51
    Width = 239
    Height = 695
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 543
    object tvStellarSystems: TTreeView
      Left = 1
      Top = 35
      Width = 237
      Height = 498
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Indent = 33
      TabOrder = 0
    end
    object stStar: TStaticText
      Left = 1
      Top = 1
      Width = 237
      Height = 34
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Alignment = taCenter
      Caption = 'Star'
      TabOrder = 1
    end
  end
  object PanelRight: TPanel
    Left = 1029
    Top = 51
    Width = 222
    Height = 695
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alRight
    TabOrder = 3
    ExplicitLeft = 854
    ExplicitHeight = 543
    object tvExoplanets: TTreeView
      Left = 1
      Top = 35
      Width = 220
      Height = 498
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Indent = 33
      TabOrder = 0
    end
    object chbTerranets: TCheckBox
      Left = 42
      Top = 571
      Width = 170
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Terranets'
      TabOrder = 1
    end
    object stExoplanets: TStaticText
      Left = 1
      Top = 1
      Width = 220
      Height = 34
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Alignment = taCenter
      Caption = 'Exoplanets'
      TabOrder = 2
    end
  end
  object GLSceneViewer: TGLSceneViewer
    Left = 239
    Top = 51
    Width = 790
    Height = 695
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 163.624389648437500000
    PenAsTouch = False
    Align = alClient
    TabOrder = 4
    ExplicitLeft = 224
    ExplicitWidth = 655
    ExplicitHeight = 616
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
