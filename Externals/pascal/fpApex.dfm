object FormApex: TFormApex
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'ApexP'
  ClientHeight = 724
  ClientWidth = 1182
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 168
  TextHeight = 30
  object Splitter1: TSplitter
    Left = 197
    Top = 51
    Width = 5
    Height = 605
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    MinSize = 53
    ExplicitLeft = 325
    ExplicitTop = 102
    ExplicitHeight = 554
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 51
    Width = 197
    Height = 605
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 673
    object tvApex: TTreeView
      Left = 1
      Top = 43
      Width = 195
      Height = 513
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Indent = 33
      TabOrder = 0
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
      ExplicitHeight = 581
    end
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 195
      Height = 42
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      TabOrder = 1
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 556
      Width = 195
      Height = 48
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 624
    end
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 1182
    Height = 51
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    RowSize = 46
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 656
    Width = 1182
    Height = 68
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Panels = <>
    ExplicitTop = 0
    ExplicitWidth = 14
  end
  object MainMenu: TMainMenu
    Left = 368
    Top = 56
    object miFile: TMenuItem
      Caption = 'File'
      object miNew: TMenuItem
        Caption = 'New'
      end
      object Open1: TMenuItem
        Caption = 'Open...'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
      object SaveAs1: TMenuItem
        Caption = 'Save as...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'Exit'
        OnClick = miExitClick
      end
    end
    object miEdit: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Caption = 'Undo'
        ShortCut = 16474
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = 'Cut'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = 'Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = 'Insert'
        ShortCut = 16470
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = 'Find...'
      end
      object Replace1: TMenuItem
        Caption = 'Replace...'
      end
    end
    object Window1: TMenuItem
      Caption = 'View'
      object Hide1: TMenuItem
        Caption = 'Hide'
      end
      object Show1: TMenuItem
        Caption = 'Show...'
      end
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object Contents1: TMenuItem
        Caption = 'Content'
      end
      object miAbout: TMenuItem
        Caption = 'About...'
      end
    end
  end
end
