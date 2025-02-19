object FormApex: TFormApex
  Left = 0
  Top = 0
  Caption = 'ApexP'
  ClientHeight = 431
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object Splitter1: TSplitter
    Left = 113
    Top = 29
    Width = 2
    Height = 363
    ExplicitHeight = 346
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 29
    Width = 113
    Height = 363
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 321
    object tvApex: TTreeView
      Left = 1
      Top = 25
      Width = 111
      Height = 310
      Align = alClient
      Indent = 19
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
      ExplicitHeight = 268
    end
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 111
      Height = 24
      Align = alTop
      TabOrder = 1
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 335
      Width = 111
      Height = 27
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 293
    end
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 695
    Height = 29
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 667
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 392
    Width = 695
    Height = 39
    Panels = <>
    ExplicitTop = 350
    ExplicitWidth = 667
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
