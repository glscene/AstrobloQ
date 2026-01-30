object FormAbout: TFormAbout
  Left = 0
  Top = 0
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 283
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Memo1: TMemo
    Left = 120
    Top = 56
    Width = 249
    Height = 121
    Alignment = taCenter
    Lines.Strings = (
      #1056#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1080' '#1080' '#1091#1095#1072#1089#1090#1085#1080#1082#1080' '#1087#1088#1086#1077#1082#1090#1072
      #1042#1072#1089#1080#1083#1100#1077#1074' '#1055#1072#1074#1077#1083
      #1050#1086#1087#1090#1103#1077#1074' '#1051#1077#1074
      #1057#1086#1073#1086#1083#1077#1074#1072' '#1051#1080#1079#1072
      #1044#1072#1093#1080#1085' '#1040#1085#1090#1086#1085)
    TabOrder = 0
  end
  object ButtonClose: TButton
    Left = 200
    Top = 200
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 1
    OnClick = ButtonCloseClick
  end
end
