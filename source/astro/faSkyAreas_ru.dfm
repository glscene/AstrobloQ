object FormSkyAreas: TFormSkyAreas
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1080#1075#1086#1085#1099' '#1089#1086#1079#1074#1077#1079#1076#1080#1081
  ClientHeight = 633
  ClientWidth = 1000
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 633
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 608
    object tvShortNames: TTreeView
      Left = 1
      Top = 1
      Width = 183
      Height = 591
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvShortNamesClick
      Items.NodeData = {
        070800000009540054007200650065004E006F00640065002500000000000000
        00000000FFFFFFFFFFFFFFFF00000000000000000000000000010341006E0064
        000000250000000000000000000000FFFFFFFFFFFFFFFF000000000000000000
        00000000010341006E0074000000250000000000000000000000FFFFFFFFFFFF
        FFFF000000000000000000000000000103410070007300000025000000000000
        0000000000FFFFFFFFFFFFFFFF00000000000000000000000000010341007100
        72000000250000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
        00000000000103410071006C000000250000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000001034100720061000000250000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000000000000000103410072
        0069000000250000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        0000000000000103410075007200}
    end
    object PanelNames: TPanel
      Left = 1
      Top = 592
      Width = 183
      Height = 40
      Align = alBottom
      Caption = 'Name'
      ShowCaption = False
      TabOrder = 1
      ExplicitTop = 567
      object CheckBoxData: TCheckBox
        Left = 40
        Top = 12
        Width = 97
        Height = 17
        Caption = 'Data'
        TabOrder = 0
        OnClick = CheckBoxDataClick
      end
    end
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 185
    Top = 0
    Width = 815
    Height = 633
    Buffer.BackgroundColor = clBlack
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 823
  end
  object MemoData: TMemo
    Left = 376
    Top = 147
    Width = 346
    Height = 270
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    Visible = False
  end
  object GLScene1: TGLScene
    Left = 216
    Top = 40
  end
  object GLCadencer1: TGLCadencer
    Left = 216
    Top = 112
  end
end
