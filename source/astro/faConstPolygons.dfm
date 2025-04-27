object FormConstBorders: TFormConstBorders
  Left = 0
  Top = 0
  Caption = 'Constellation polygons'
  ClientHeight = 443
  ClientWidth = 676
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
    Width = 153
    Height = 443
    Align = alLeft
    TabOrder = 0
    object tvShortNames: TTreeView
      Left = 1
      Top = 41
      Width = 151
      Height = 344
      Align = alTop
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
      Top = 1
      Width = 151
      Height = 40
      Align = alTop
      Caption = 'Name'
      TabOrder = 1
    end
    object CheckBoxData: TCheckBox
      Left = 32
      Top = 400
      Width = 97
      Height = 17
      Caption = 'Data'
      TabOrder = 2
      OnClick = CheckBoxDataClick
    end
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 153
    Top = 0
    Width = 523
    Height = 443
    Buffer.BackgroundColor = clBlack
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 531
  end
  object MemoData: TMemo
    Left = 240
    Top = 91
    Width = 346
    Height = 270
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
    Visible = False
  end
  object GLScene1: TGLScene
    Left = 384
    Top = 64
  end
end
