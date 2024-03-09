object PlotColorsForm: TPlotColorsForm
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Plot Colors'
  ClientHeight = 620
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 23
  object Label9: TLabel
    Left = 25
    Top = 492
    Width = 108
    Height = 23
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Blend factor:'
  end
  object Label10: TLabel
    Left = 245
    Top = 492
    Width = 105
    Height = 23
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Move factor:'
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 11
    Width = 436
    Height = 210
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '  Upper Plot Color  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 30
      Top = 39
      Width = 51
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Red :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 12
      Top = 77
      Width = 69
      Height = 23
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Green :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 26
      Top = 116
      Width = 55
      Height = 23
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Blue :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 9
      Top = 154
      Width = 72
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Alpha :'
    end
    object UpperRed: TTrackBar
      Left = 79
      Top = 32
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 0
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = UpperRedChange
    end
    object UpperGreen: TTrackBar
      Left = 79
      Top = 72
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 1
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = UpperGreenChange
    end
    object UpperBlue: TTrackBar
      Left = 79
      Top = 114
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 2
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = UpperBlueChange
    end
    object UpperAlpha: TTrackBar
      Left = 79
      Top = 152
      Width = 355
      Height = 53
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 1000
      ParentCtl3D = False
      PageSize = 8
      Position = 1000
      TabOrder = 3
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = UpperAlphaChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 14
    Top = 226
    Width = 436
    Height = 210
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '  Lower Plot Color  '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Label5: TLabel
      Left = 30
      Top = 39
      Width = 51
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Red :'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 12
      Top = 77
      Width = 69
      Height = 23
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Green :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGreen
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 26
      Top = 116
      Width = 55
      Height = 23
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Blue :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 9
      Top = 154
      Width = 72
      Height = 28
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taRightJustify
      Caption = 'Alpha :'
    end
    object LowerRed: TTrackBar
      Left = 79
      Top = 32
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 0
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = LowerRedChange
    end
    object LowerGreen: TTrackBar
      Left = 79
      Top = 72
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 1
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = LowerGreenChange
    end
    object LowerBlue: TTrackBar
      Left = 79
      Top = 114
      Width = 355
      Height = 52
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 255
      ParentCtl3D = False
      PageSize = 8
      Position = 128
      TabOrder = 2
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = LowerBlueChange
    end
    object LowerAlpha: TTrackBar
      Left = 79
      Top = 152
      Width = 355
      Height = 53
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Ctl3D = False
      Max = 1000
      ParentCtl3D = False
      PageSize = 8
      Position = 1000
      TabOrder = 3
      ThumbLength = 26
      TickMarks = tmTopLeft
      TickStyle = tsNone
      OnChange = LowerAlphaChange
    end
  end
  object UpperLowerLock: TCheckBox
    Left = 53
    Top = 445
    Width = 358
    Height = 29
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Lock Lower Color to Upper Color'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = UpperLowerLockClick
  end
  object EditBlend: TEdit
    Left = 140
    Top = 487
    Width = 88
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 3
    OnKeyDown = EditBlendKeyDown
    OnKeyPress = EditBlendKeyPress
    OnKeyUp = EditBlendKeyUp
  end
  object EditMove: TEdit
    Left = 361
    Top = 487
    Width = 87
    Height = 31
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    TabOrder = 4
    OnKeyDown = EditBlendKeyDown
    OnKeyPress = EditMoveKeyPress
    OnKeyUp = EditMoveKeyUp
  end
  object ApplyBtn: TBitBtn
    Left = 14
    Top = 541
    Width = 210
    Height = 52
    Cursor = crHandPoint
    Hint = 'Update any changes made'
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Apply'
    Default = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF936035936035936035936035936035936035FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF936035936035C6923DE3B445F7
      CE4AF7CF4BE3BB47C79940936035936035FF00FFFF00FFFF00FFFF00FFFF00FF
      936035B57A36DD9838F0AD38F3B538F5BC3BF6BE3CF5BB3BF3B63BE1A33DB87F
      38936035FF00FFFF00FFFF00FF936035B27233DC872FE4922DDCA457D7BC8FD7
      C097D8C096D8C199D5B582E69E38E09233B47634936035FF00FFFF00FF936035
      CD6F28DA7B25D2A374F9FDFEF9FDFEF9FDFEF9FDFEF9FDFEF9FDFEDF8E32E08A
      2FD0782C936035FF00FF936035B4652BD3661FD27A37F9FDFED5B69ADA8229DE
      892DDF8A2FD9852DDC8227DD832DDA7B2AD67226B5682C936035936035C05A21
      CE5A17D07D47F9FDFED18C57DA711CDB7B29DC7822F9FDFED2905BD76D1CD56E
      25D26722C25E24936035936035C64C18CA5015CB6A36F9FDFED8AD91CD5F16D0
      641BCF5E0FF9FDFEF9FDFECD7F4CCF5A15CD5B1EC7521B936035936035C24212
      C54613C5480FD5A38CF5FCFFF9FDFEF9FDFEF9FDFEF9FDFEF9FDFEF9FDFECB70
      43C84B12C34917936035936035C15F39C9552DC95124C54918D08464E4BDAEE7
      C8BCE6C5B8F9FDFEF9FDFEF9FDFEC7663FC33E0CB84618936035936035B5704B
      D3765CD4785BD47555D06842CD6239CC5E33C74D1DF9FDFEF7F5F4CA7252C23D
      0FC24119AD5428936035FF00FF936035CD7C64D6816AD7836AD8846BD8856BD8
      846AD77F63F9FDFED59B89D27154D4775CC86F55936035FF00FFFF00FF936035
      B17855D88B7ADA8E7BDA8E7BDA8E7ADA8D79DB8C78D58974D78570D98974D483
      70B07450936035FF00FFFF00FFFF00FF936035B37F5DD79886E09E90E09E8FDF
      9D8EDF9C8CDF9A8ADE9888D38F7DB27B59936035FF00FFFF00FFFF00FFFF00FF
      FF00FF936035936035BE8E71D6A28FE4AEA1E4ADA0D5A08CBE8B6E9360359360
      35FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF93603593603593
      6035936035936035936035FF00FFFF00FFFF00FFFF00FFFF00FF}
    TabOrder = 5
    Visible = False
    OnClick = ApplyBtnClick
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 541
    Width = 210
    Height = 52
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = '&Close'
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      040000000000800000000000000000000000100000001000000000000000FFFF
      000000008400FF00FF0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00330000000000
      0333330244444444033333022444444403333302224444440333330222044444
      0333330222044444033333022204444403333302220444440333330222044444
      0333330222044444033333022240444403333302220444440333330222044444
      0333330212044444033333021104444403333300000000000333}
    TabOrder = 6
    OnClick = BitBtn1Click
  end
end
