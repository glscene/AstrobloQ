object FormAbout: TFormAbout
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 448
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -21
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 168
  TextHeight = 30
  object Memo: TMemo
    Left = 266
    Top = 140
    Width = 338
    Height = 170
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Alignment = taCenter
    Lines.Strings = (
      #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1080
      ''
      #1055#1072#1074#1077#1083' '#1042#1072#1089#1080#1083#1100#1077#1074
      #1051#1077#1074' '#1050#1086#1087#1090#1103#1077#1074
      #1044#1072#1085#1080#1083' '#1050#1086#1083#1091#1096#1077#1074)
    TabOrder = 0
    Visible = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 877
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = #1057#1080#1084#1091#1083#1103#1090#1086#1088' '#1055#1072#1088#1072#1076#1086#1082#1089#1072' '#1060#1077#1088#1084#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button1: TButton
    Left = 746
    Top = 394
    Width = 131
    Height = 44
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Ok'
    ModalResult = 1
    TabOrder = 2
  end
end
