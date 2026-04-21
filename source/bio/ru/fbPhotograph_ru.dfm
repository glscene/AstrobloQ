object FormPhotograph: TFormPhotograph
  Left = 266
  Top = 190
  Caption = #1060#1086#1090#1086#1075#1088#1072#1092#1080#1103
  ClientHeight = 254
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = -30
    Width = 450
    Height = 240
    Align = alBottom
    TabOrder = 0
    ExplicitTop = -27
    object Label1: TLabel
      Left = 40
      Top = 64
      Width = 56
      Height = 13
      Caption = #1060#1086#1090#1086#1075#1088#1072#1092':'
    end
    object Label2: TLabel
      Left = 48
      Top = 168
      Width = 42
      Height = 13
      Caption = #1057#1085#1080#1084#1086#1082':'
    end
    object Label3: TLabel
      Left = 64
      Top = 96
      Width = 41
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072':'
    end
    object Label4: TLabel
      Left = 224
      Top = 96
      Width = 42
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072':'
    end
    object Label5: TLabel
      Left = 64
      Top = 200
      Width = 41
      Height = 13
      Caption = #1042#1099#1089#1086#1090#1072':'
    end
    object Label6: TLabel
      Left = 224
      Top = 200
      Width = 42
      Height = 13
      Caption = #1064#1080#1088#1080#1085#1072':'
    end
    object Label7: TLabel
      Left = 64
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object edPhotograph: TEdit
      Left = 112
      Top = 64
      Width = 225
      Height = 21
      TabOrder = 1
      Text = 'snapshot1.bmp'
    end
    object edThumbnail: TEdit
      Left = 112
      Top = 168
      Width = 225
      Height = 21
      TabOrder = 6
      Text = 'snapshot1-thumb.bmp'
    end
    object cbCreateThumbnail: TCheckBox
      Left = 112
      Top = 144
      Width = 137
      Height = 17
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1089#1085#1080#1084#1086#1082'?'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object edPhotoHeight: TEdit
      Left = 112
      Top = 96
      Width = 73
      Height = 21
      TabOrder = 3
      Text = '320'
    end
    object edPhotoWidth: TEdit
      Left = 264
      Top = 96
      Width = 73
      Height = 21
      TabOrder = 4
      Text = '640'
    end
    object edThumbHeight: TEdit
      Left = 112
      Top = 200
      Width = 73
      Height = 21
      TabOrder = 8
      Text = '320'
    end
    object edThumbWidth: TEdit
      Left = 264
      Top = 200
      Width = 73
      Height = 21
      TabOrder = 9
      Text = '640'
    end
    object btnPhotograph: TBitBtn
      Left = 344
      Top = 64
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 2
      OnClick = btnPhotographClick
    end
    object btnThumbnail: TBitBtn
      Left = 344
      Top = 168
      Width = 25
      Height = 25
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
      TabOrder = 7
      OnClick = btnThumbnailClick
    end
    object edName: TEdit
      Left = 113
      Top = 37
      Width = 225
      Height = 21
      TabOrder = 0
      Text = 'snapshot1'
      OnChange = edNameChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 210
    Width = 450
    Height = 44
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 185
    ExplicitWidth = 442
    object Panel4: TPanel
      Left = 272
      Top = 1
      Width = 177
      Height = 42
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 264
      object BitBtn1: TBitBtn
        Left = 86
        Top = 8
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 6
        Top = 8
        Width = 75
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1072
        Kind = bkCancel
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  object SaveDialog: TSaveDialog
    Left = 641
    Top = 116
  end
end
