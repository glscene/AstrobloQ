object frmApex: TfrmApex
  Left = 0
  Top = 0
  Caption = 'ApexC'
  ClientHeight = 470
  ClientWidth = 742
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
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 742
    Height = 27
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 622
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 452
    Width = 742
    Height = 18
    Panels = <>
    ExplicitTop = 442
    ExplicitWidth = 622
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 27
    Width = 153
    Height = 425
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 415
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 151
      Height = 24
      Align = alTop
      TabOrder = 0
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 403
      Width = 151
      Height = 21
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 393
    end
    object tvApex: TTreeView
      Left = 1
      Top = 25
      Width = 151
      Height = 378
      Align = alClient
      Indent = 19
      TabOrder = 2
      OnClick = tvApexClick
      Items.NodeData = {
        070F00000009540054007200650065004E006F00640065002700000000000000
        00000000FFFFFFFFFFFFFFFF00000000000000000000000000010443006F0063
        006F000000290000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000000000000010543006F006D006500740000002D0000000000000000000000
        FFFFFFFFFFFFFFFF00000000000000000000000000010743006F006E00740072
        006F006C0000002D0000000000000000000000FFFFFFFFFFFFFFFF0000000000
        00000000000000000107450063006C00690070007300650000002F0000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000000000000000108450063
        006C00740069006D00650072000000270000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000000010446006F0074006F00000027000000
        0000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001044C
        0075006E00610000002D0000000000000000000000FFFFFFFFFFFFFFFF000000
        0000000000000000000001074E00650077006D006F006F006E0000002B000000
        0000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001064E
        0075006D0069006E00740000002B0000000000000000000000FFFFFFFFFFFFFF
        FF0000000000000000000000000001064F006300630075006C00740000002B00
        00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
        064F00720062006400650074000000270000000000000000000000FFFFFFFFFF
        FFFFFF0000000000000000000000000001045000680079007300000031000000
        0000000000000000FFFFFFFFFFFFFFFF00000000000000000000000000010950
        006C0061006E006500740070006F0073000000330000000000000000000000FF
        FFFFFFFFFFFFFF00000000000000000000000000010A50006C0061006E006500
        7400720069007300650000002B0000000000000000000000FFFFFFFFFFFFFFFF
        000000000000000000000000000106530075006E00730065007400}
      ExplicitHeight = 368
    end
  end
  object MainMenu1: TMainMenu
    Left = 368
    Top = 56
    object MenuItem1: TMenuItem
      Caption = 'File'
      object MenuItem2: TMenuItem
        Caption = 'New'
      end
      object MenuItem3: TMenuItem
        Caption = 'Open...'
      end
      object MenuItem4: TMenuItem
        Caption = 'Save'
      end
      object MenuItem5: TMenuItem
        Caption = 'Save as...'
      end
      object MenuItem6: TMenuItem
        Caption = '-'
      end
      object MenuItem7: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
    object MenuItem8: TMenuItem
      Caption = 'Edit'
      object MenuItem9: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
      end
      object MenuItem10: TMenuItem
        Caption = '-'
      end
      object MenuItem11: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
      end
      object MenuItem12: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
      end
      object MenuItem13: TMenuItem
        Caption = 'Insert'
        ShortCut = 16470
      end
      object MenuItem14: TMenuItem
        Caption = '-'
      end
      object MenuItem15: TMenuItem
        Caption = 'Find...'
      end
      object MenuItem16: TMenuItem
        Caption = 'Replace...'
      end
    end
    object MenuItem17: TMenuItem
      Caption = 'View'
      object MenuItem18: TMenuItem
        Caption = 'Hide'
      end
      object MenuItem19: TMenuItem
        Caption = 'Show...'
      end
    end
    object MenuItem20: TMenuItem
      Caption = 'Help'
      object MenuItem21: TMenuItem
        Caption = 'Content'
      end
      object MenuItem22: TMenuItem
        Caption = 'About...'
      end
    end
  end
end
