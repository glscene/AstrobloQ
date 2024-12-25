object FormConstBorders: TFormConstBorders
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Constellation polygons'
  ClientHeight = 776
  ClientWidth = 1183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 267
    Height = 776
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 0
    object tvShortNames: TTreeView
      Left = 1
      Top = 71
      Width = 265
      Height = 602
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Indent = 33
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
      Width = 265
      Height = 70
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Name'
      TabOrder = 1
    end
    object CheckBoxData: TCheckBox
      Left = 56
      Top = 700
      Width = 169
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Data'
      TabOrder = 2
      OnClick = CheckBoxDataClick
    end
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 267
    Top = 0
    Width = 916
    Height = 776
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Buffer.BackgroundColor = clBlack
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 826
  end
  object MemoData: TMemo
    Left = 420
    Top = 160
    Width = 606
    Height = 472
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
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
