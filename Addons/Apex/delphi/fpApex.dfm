object FormApex: TFormApex
  Left = 0
  Top = 0
  Caption = 'ApexP'
  ClientHeight = 465
  ClientWidth = 695
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
  object Splitter1: TSplitter
    Left = 113
    Top = 29
    Width = 2
    Height = 397
    ExplicitHeight = 346
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 29
    Width = 113
    Height = 397
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 372
    object tvApex: TTreeView
      Left = 1
      Top = 25
      Width = 111
      Height = 344
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
      ExplicitHeight = 319
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
      Top = 369
      Width = 111
      Height = 27
      Align = alBottom
      TabOrder = 2
      ExplicitTop = 344
    end
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 695
    Height = 29
    Align = alTop
    TabOrder = 1
    ExplicitWidth = 687
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 426
    Width = 695
    Height = 39
    Panels = <>
    ExplicitTop = 401
    ExplicitWidth = 687
  end
  object MainMenu1: TMainMenu
    Left = 299
    Top = 105
    object MenuItem1: TMenuItem
      Caption = #1060#1072#1081#1083
      object MenuItem2: TMenuItem
        Caption = #1053#1086#1074#1099#1081
      end
      object MenuItem3: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object MenuItem4: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      end
      object MenuItem5: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      end
      object MenuItem6: TMenuItem
        Caption = '-'
      end
      object MenuItem7: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = miExitClick
      end
    end
    object MenuItem8: TMenuItem
      Caption = #1055#1088#1072#1074#1082#1072
      object MenuItem9: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1072
        ShortCut = 16474
      end
      object MenuItem10: TMenuItem
        Caption = '-'
      end
      object MenuItem11: TMenuItem
        Caption = #1042#1099#1088#1077#1079#1072#1090#1100
        ShortCut = 16472
      end
      object MenuItem12: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
        ShortCut = 16451
      end
      object MenuItem13: TMenuItem
        Caption = #1042#1089#1090#1072#1074#1080#1090#1100
        ShortCut = 16470
      end
      object MenuItem14: TMenuItem
        Caption = '-'
      end
      object MenuItem15: TMenuItem
        Caption = #1053#1072#1081#1090#1080'...'
      end
      object MenuItem16: TMenuItem
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100'...'
      end
    end
    object MenuItem17: TMenuItem
      Caption = #1042#1080#1076
      object MenuItem18: TMenuItem
        Caption = #1057#1082#1088#1099#1090#1100
      end
      object MenuItem19: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
      end
    end
    object MenuItem20: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object MenuItem21: TMenuItem
        Caption = 'Ruwiki...'
      end
      object MenuItem22: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
end
