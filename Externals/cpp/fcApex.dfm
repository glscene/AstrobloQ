object FormApex: TFormApex
  Left = 0
  Top = 0
  Caption = 'ApexC'
  ClientHeight = 451
  ClientWidth = 630
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
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 630
    Height = 27
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 622
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 433
    Width = 630
    Height = 18
    Panels = <>
    ExplicitTop = 408
    ExplicitWidth = 622
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 27
    Width = 153
    Height = 406
    Align = alLeft
    TabOrder = 2
    ExplicitHeight = 381
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
      Top = 384
      Width = 151
      Height = 21
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 359
    end
    object tvApex: TTreeView
      Left = 1
      Top = 25
      Width = 151
      Height = 359
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
      ExplicitHeight = 334
    end
  end
  object MainMenu: TMainMenu
    Left = 595
    Top = 105
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miNew: TMenuItem
        Caption = #1053#1086#1074#1099#1081
      end
      object Open1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object Save1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object SaveAs1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object miEdit: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object Undo1: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1072
        ShortCut = 16474
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = #1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1100
        ShortCut = 16470
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = #1053#1072#1081#1090#1080'...'
      end
      object Replace1: TMenuItem
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100'...'
      end
    end
    object Window1: TMenuItem
      Caption = #1042#1080#1076
      object Hide1: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100
      end
      object Show1: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      end
    end
    object Help1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object Contents1: TMenuItem
        Caption = 'Ruwiki...'
      end
      object miAbout: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
end
