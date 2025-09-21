object FormError: TFormError
  Left = 322
  Top = 166
  Caption = #1054#1096#1080#1073#1082#1072' '#1074' Biosfera!'
  ClientHeight = 419
  ClientWidth = 613
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 613
    Height = 41
    Align = alTop
    Alignment = taLeftJustify
    BorderWidth = 10
    Caption = 'Biosfera '#1076#1072#1083#1072' '#1089#1073#1086#1081'.  '#1057#1083#1077#1076#1091#1081#1090#1077' '#1091#1082#1072#1079#1072#1085#1085#1099#1084' '#1074#1085#1080#1079#1091' '#1096#1072#1075#1072#1084'.'
    TabOrder = 0
    ExplicitWidth = 605
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 613
    Height = 121
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 232
    ExplicitWidth = 605
    object Label1: TLabel
      Left = 12
      Top = 78
      Width = 346
      Height = 13
      Caption = #1064#1072#1075'3: '#1055#1086#1087#1088#1086#1073#1091#1081#1090#1077' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1073#1086#1083#1077#1077' '#1085#1086#1074#1091#1102' '#1074#1077#1088#1089#1080#1102' '#1080#1079' '#1088#1077#1087#1086#1079#1080#1090#1086#1088#1080#1103':'
    end
    object Label2: TLabel
      Left = 38
      Top = 93
      Width = 212
      Height = 13
      Cursor = crHandPoint
      Caption = 'https://gitverse.ru/project/glscene/astrobloq'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 12
      Top = 44
      Width = 300
      Height = 13
      Caption = #1064#1072#1075'2: '#1054#1090#1087#1088#1072#1074#1100#1090#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1087#1086' '#1089#1089#1099#1083#1082#1077' '#1085#1080#1078#1077' '#1085#1072#1078#1072#1074' Ctrl+V.'
    end
    object Label4: TLabel
      Left = 38
      Top = 60
      Width = 98
      Height = 13
      Cursor = crHandPoint
      Caption = 'https://t.me/glscene'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 12
      Top = 24
      Width = 222
      Height = 13
      Caption = #1064#1072#1075'1: '#1057#1082#1086#1087#1080#1088#1091#1081#1090#1077' '#1090#1077#1082#1089#1090' '#1074#1099#1096#1077' '#1085#1072#1078#1072#1074' Ctrl+C.'
    end
    object Label6: TLabel
      Left = 10
      Top = 6
      Width = 134
      Height = 13
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077' '#1086#1073' '#1086#1096#1080#1073#1082#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 41
    Width = 613
    Height = 216
    Align = alClient
    BorderWidth = 5
    TabOrder = 2
    ExplicitWidth = 605
    ExplicitHeight = 191
    object memReport: TMemo
      Left = 6
      Top = 6
      Width = 601
      Height = 204
      Align = alClient
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 0
      WordWrap = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 378
    Width = 613
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 353
    ExplicitWidth = 605
    object Button4: TButton
      Left = 494
      Top = 6
      Width = 99
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 0
      OnClick = Button4Click
    end
    object btnSaveWorld: TBitBtn
      Left = 10
      Top = 8
      Width = 99
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1084#1080#1088
      TabOrder = 1
      OnClick = btnSaveWorldClick
    end
  end
end
