object FormManager: TFormManager
  Left = 470
  Top = 107
  Align = alLeft
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = #1052#1086#1085#1080#1090#1086#1088#1099
  ClientHeight = 530
  ClientWidth = 154
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 154
    Height = 225
    Align = alTop
    BevelOuter = bvLowered
    BorderWidth = 10
    TabOrder = 0
    object Panel2: TPanel
      Left = 11
      Top = 11
      Width = 132
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = #1056#1077#1072#1083#1100#1085#1086#1089#1090#1100
      Color = clActiveBorder
      TabOrder = 0
    end
    object ToolBar1: TToolBar
      Left = 11
      Top = 36
      Width = 132
      Height = 178
      Align = alClient
      ButtonHeight = 19
      ButtonWidth = 117
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      List = True
      ShowCaptions = True
      TabOrder = 1
      object tbTime: TToolButton
        Left = 0
        Top = 0
        Hint = #1042#1088#1077#1084#1103
        Caption = #1042#1088#1077#1084#1103'                        '
        Down = True
        ImageIndex = 38
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        OnClick = tbTimeClick
      end
      object tbSpace: TToolButton
        Left = 0
        Top = 19
        Hint = #1050#1086#1089#1084#1086#1089
        Caption = #1050#1086#1089#1084#1086#1089
        ImageIndex = 63
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbSpaceClick
      end
      object tbPopulations: TToolButton
        Left = 0
        Top = 38
        Hint = #1055#1086#1087#1091#1083#1103#1094#1080#1080
        Caption = #1055#1086#1087#1091#1083#1103#1094#1080#1103
        ImageIndex = 117
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbPopulationsClick
      end
      object tbHeightField: TToolButton
        Left = 0
        Top = 57
        Hint = #1050#1072#1088#1090#1072' '#1090#1077#1084#1087#1077#1088#1072#1090#1091#1088#1099
        Caption = #1058#1077#1084#1087#1077#1088#1072#1090#1091#1088#1072
        ImageIndex = 77
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbHeightFieldClick
      end
      object tbHumidityMap: TToolButton
        Left = 0
        Top = 76
        Hint = #1050#1072#1088#1090#1072' '#1074#1083#1072#1078#1085#1086#1089#1090#1080
        Caption = #1042#1083#1072#1078#1085#1086#1089#1090#1100
        ImageIndex = 57
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbHumidityMapClick
      end
      object tbConstruction: TToolButton
        Left = 0
        Top = 95
        Caption = #1050#1086#1085#1089#1090#1088#1091#1082#1094#1080#1103
        ImageIndex = 40
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbConstructionClick
      end
      object tbLists: TToolButton
        Left = 0
        Top = 114
        Hint = #1054#1082#1085#1086' '#1089#1087#1080#1089#1082#1086#1074
        Caption = #1057#1087#1080#1089#1082#1080
        ImageIndex = 26
        ParentShowHint = False
        Wrap = True
        ShowHint = True
        Style = tbsCheck
        OnClick = tbListsClick
      end
      object tbEvents: TToolButton
        Left = 0
        Top = 133
        Hint = #1054#1082#1085#1086' '#1089#1086#1073#1099#1090#1080#1081
        Caption = #1057#1086#1073#1099#1090#1080#1103
        ImageIndex = 30
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = tbEventsClick
      end
    end
  end
  object panSpirits: TPanel
    Left = 0
    Top = 225
    Width = 154
    Height = 305
    Align = alClient
    BevelOuter = bvLowered
    BorderWidth = 10
    TabOrder = 1
    object Panel1: TPanel
      Left = 11
      Top = 11
      Width = 132
      Height = 25
      Align = alTop
      BevelOuter = bvLowered
      Caption = #1042#1080#1076
      Color = clInactiveBorder
      TabOrder = 0
    end
    object tbSpirits: TToolBar
      Left = 11
      Top = 36
      Width = 132
      Height = 230
      Align = alClient
      ButtonWidth = 43
      Caption = 'tbSpirits'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      List = True
      ShowCaptions = True
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 11
      Top = 266
      Width = 132
      Height = 28
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnAddThing: TBitBtn
        Left = 0
        Top = 0
        Width = 123
        Height = 25
        Caption = #1042#1080#1076' '#1094#1077#1083#1080
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333333FFFFF3333333333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC377777737F777777F008888070888
          8003773FFF7773FFF77F0F0770F7F0770F037F777737F777737F70FFFFF7FFFF
          F07373F3FFF7F3FFF37F70F000F7F000F07337F77737F777373330FFFFF7FFFF
          F03337FF3FF7F3FF37F3370F00F7F00F0733373F7737F77337F3370FFFF7FFFF
          0733337F33373F337333330FFF030FFF03333373FF7373FF7333333000333000
          3333333777333777333333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btnAddThingClick
      end
    end
  end
end
