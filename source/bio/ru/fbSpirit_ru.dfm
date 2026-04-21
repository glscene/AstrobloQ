object FormSpirit: TFormSpirit
  Left = 709
  Top = 182
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1042#1100#1102#1077#1088' '#1073#1080#1086#1090#1099
  ClientHeight = 465
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    000000000000330077000000000000000000000000003B077070000000000000
    000000000000BB807007000000000000000000000300B0007000700000000000
    00000000330070070700070000000000000000003B0700700070007000000000
    00000000BB800700000700070000000000000300B00070000000700070000000
    0000330070070000000007000700000000003B07007000000000007007000000
    0000BB800700000000000007070000000300B000700000000070000077000000
    330070070000000007000000803300003B070070000000000000000800330000
    BB8007000000000000000080BBBB0300B000700000000070000008000BB03300
    70070000000707000000803300003B070070000000707000000800330000BB80
    07000000070700000080BBBB0000B000700000000070000008000BB000007007
    0000000007000000803300000000707000007770000000080033000000008700
    0007070700000080BBBB00000000080000077777000008000BB0000000000080
    0007070700008033000000000000000800007770000800330000000000000000
    800000000080BBBB00000000000000000800000008000BB00000000000000000
    0080000080330000000000000000000000080008003300000000000000000000
    00008080BBBB00000000000000000000000008000BB00000000000000000FFFF
    33FFFFFF21FFFFFF00FFFFFB007FFFF3003FFFF2001FFFF0000FFFB00007FF30
    0003FF200003FF000003FB000003F3000000F2000000F0000010B00000393000
    000F2000000F0000010F0000039F000000FF000000FF000010FF800039FFC000
    0FFFE0000FFFF0010FFFF8039FFFFC00FFFFFE00FFFFFF10FFFFFFB9FFFF}
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnMouseWheel = FormMouseWheel
  OnShow = FormShow
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 722
    Height = 465
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 714
    ExplicitHeight = 440
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 722
      Height = 465
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 714
      ExplicitHeight = 440
      object ViewSplitter: TSplitter
        Left = 0
        Top = 174
        Width = 722
        Height = 2
        Cursor = crVSplit
        Align = alTop
        MinSize = 24
        Visible = False
      end
      object tbTools: TToolBar
        Left = 0
        Top = 0
        Width = 722
        Height = 23
        ButtonHeight = 27
        ButtonWidth = 106
        Caption = 'tbTools'
        List = True
        ShowCaptions = True
        TabOrder = 0
        ExplicitWidth = 714
        object tbTrack: TToolButton
          Left = 0
          Top = 0
          Caption = #1058#1088#1077#1082
          ImageIndex = 37
          OnClick = tbTrackClick
        end
        object tbModify: TToolButton
          Left = 106
          Top = 0
          Caption = #1052#1086#1076#1080#1092#1080#1094#1080#1088#1086#1074#1072#1090#1100
          DropdownMenu = ModifyMenu
          ImageIndex = 35
          Style = tbsDropDown
        end
        object tbWindow: TToolButton
          Left = 241
          Top = 0
          Caption = #1054#1082#1085#1086
          DropdownMenu = WindowMenu
          ImageIndex = 31
          Style = tbsDropDown
        end
        object cbView: TCheckBox
          Left = 376
          Top = 0
          Width = 48
          Height = 27
          Caption = #1042#1080#1076
          TabOrder = 0
          OnClick = cbViewClick
        end
      end
      object FullDisplay: TMemo
        Left = 0
        Top = 176
        Width = 722
        Height = 289
        Align = alClient
        Color = clWhite
        ParentShowHint = False
        ReadOnly = True
        ScrollBars = ssBoth
        ShowHint = False
        TabOrder = 1
        WordWrap = False
        ExplicitWidth = 714
        ExplicitHeight = 264
      end
      object GLSceneTracker: TGLSceneViewer
        Left = 0
        Top = 23
        Width = 722
        Height = 151
        Buffer.BackgroundColor = clBlack
        PenAsTouch = False
        OnMouseEnter = GLSceneTrackerMouseEnter
        Align = alTop
        Visible = False
        OnMouseDown = GLSceneTrackerMouseDown
        OnMouseMove = GLSceneTrackerMouseMove
        TabOrder = 2
      end
    end
  end
  object ModifyMenu: TPopupMenu
    Left = 82
    Top = 26
    object Heal1: TMenuItem
      Caption = '&'#1051#1077#1095#1077#1085#1080#1077
      OnClick = Heal1Click
    end
    object Stop1: TMenuItem
      Caption = '&'#1054#1089#1090#1072#1085#1086#1074#1082#1072
      OnClick = Stop1Click
    end
    object Kill1: TMenuItem
      Caption = '&'#1055#1088#1077#1082#1088#1072#1097#1077#1085#1080#1077
      OnClick = Kill1Click
    end
    object Die1: TMenuItem
      Caption = '&'#1043#1080#1073#1077#1083#1100
      OnClick = Die1Click
    end
    object Reposition1: TMenuItem
      Caption = '&'#1055#1086#1079#1080#1094#1080#1103' (Edit)'
      OnClick = Reposition1Click
    end
    object menuDNA: TMenuItem
      Caption = 'D&NA (Edit)'
      OnClick = menuDNAClick
    end
  end
  object WindowMenu: TPopupMenu
    Left = 180
    Top = 26
    object Refresh1: TMenuItem
      Caption = '&'#1054#1089#1074#1077#1078#1080#1090#1100
      OnClick = Refresh1Click
    end
    object Scrollbars1: TMenuItem
      Caption = '&Scrollbars'
      Checked = True
      OnClick = Scrollbars1Click
    end
    object OnTop1: TMenuItem
      Caption = '&'#1053#1072#1074#1077#1088#1093
      OnClick = OnTop1Click
    end
    object Close1: TMenuItem
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100
      OnClick = Close1Click
    end
    object LockCamera1: TMenuItem
      Caption = '&Lock '#1082#1072#1084#1077#1088#1091
      OnClick = LockCamera1Click
    end
    object Wordwrap1: TMenuItem
      Caption = '&Wordwrap'
      OnClick = Wordwrap1Click
    end
  end
end
