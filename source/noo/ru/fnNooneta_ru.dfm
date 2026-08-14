object FormCrafts: TFormCrafts
  Left = 0
  Top = 0
  Caption = #1053#1086#1086#1085#1077#1090#1072
  ClientHeight = 412
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 129
    Height = 412
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 385
    object tvCraft: TTreeView
      Left = 1
      Top = 1
      Width = 127
      Height = 410
      Align = alClient
      Indent = 19
      TabOrder = 0
      OnClick = tvCraftClick
      Items.NodeData = {
        070600000009540054007200650065004E006F00640065003100000000000000
        00000000FFFFFFFFFFFFFFFF0000000000000000000000000001092104430431
        043C043004400438043D0430040000290000000000000000000000FFFFFFFFFF
        FFFFFF00000000000000000000000000010528043004420442043B0400003100
        00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000001
        0910044104420440043E04340440043E043D0400003500000000000000000000
        00FFFFFFFFFFFFFFFF00000000000000000000000000010B1204300440043F04
        2D0034043204380436043E043A040000350000000000000000000000FFFFFFFF
        FFFFFFFF00000000000000000000000000010B10043D043D043804330438043B
        044F0442043E0440040000330000000000000000000000FFFFFFFFFFFFFFFF00
        000000000000000000000000010A1D043E043E043B043E043A04300442043E04
        4004}
      ExplicitHeight = 383
    end
  end
  object MainMenu: TMainMenu
    Left = 272
    Top = 64
    object F1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100'...'
      end
      object N4: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object N3: TMenuItem
        Caption = #1042#1099#1093#1086#1076'...'
        OnClick = N3Click
      end
    end
    object N1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072
      object N2: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'...'
      end
    end
  end
end
