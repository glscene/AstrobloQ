inherited FormGLOptions: TFormGLOptions
  HelpContext = 0
  Caption = 'Options'
  ClientHeight = 405
  ClientWidth = 549
  StyleElements = [seFont, seClient, seBorder]
  OnClose = FormClose
  ExplicitWidth = 565
  ExplicitHeight = 444
  TextHeight = 20
  inherited PanelTop: TPanel
    Width = 549
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 513
  end
  inherited PanelMiddle: TPanel
    Width = 549
    Height = 329
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 513
    ExplicitHeight = 293
    inherited Memo: TMemo
      Width = 547
      Height = 327
      StyleElements = [seFont, seClient, seBorder]
      ExplicitLeft = 2
      ExplicitTop = 2
      ExplicitWidth = 519
      ExplicitHeight = 316
    end
    object rgLanguages: TRadioGroup
      Left = 28
      Top = 88
      Width = 477
      Height = 137
      Caption = #1071#1079#1099#1082
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        #1056#1091#1089#1089#1082#1080#1081
        #1040#1085#1075#1083#1080#1081#1089#1082#1080#1081
        #1048#1089#1087#1072#1085#1089#1082#1080#1081
        #1055#1086#1088#1090#1091#1075#1072#1083#1100#1089#1082#1080#1081
        #1060#1088#1072#1085#1094#1091#1079#1089#1082#1080#1081
        #1053#1077#1084#1077#1094#1082#1080#1081
        #1048#1090#1072#1083#1100#1103#1085#1089#1082#1080#1081
        #1050#1080#1090#1072#1081#1089#1082#1080#1081
        #1055#1077#1088#1089#1080#1076#1089#1082#1080#1081)
      TabOrder = 1
      OnClick = rgLanguagesClick
    end
    object PanelBackground: TPanel
      Left = 375
      Top = 27
      Width = 25
      Height = 25
      Hint = 'Click to change background colour'
      BevelInner = bvLowered
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      OnClick = PanelBackgroundClick
    end
    object Фон: TStaticText
      Left = 206
      Top = 27
      Width = 125
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = #1060#1086#1085
      TabOrder = 3
    end
  end
  inherited PanelBottom: TPanel
    Top = 364
    Width = 549
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 328
    ExplicitWidth = 513
    inherited ButtonOK: TButton
      OnClick = ButtonOKClick
    end
  end
end
