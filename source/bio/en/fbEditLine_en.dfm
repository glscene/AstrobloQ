object FormEditLine: TFormEditLine
  Left = 241
  Top = 234
  Margins.Left = 2
  Margins.Top = 2
  Margins.Right = 2
  Margins.Bottom = 2
  Caption = 'Edit'
  ClientHeight = 81
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  TextHeight = 13
  object labName: TLabel
    Left = 18
    Top = 12
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object edLine: TEdit
    Left = 18
    Top = 31
    Width = 251
    Height = 21
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 278
    Top = 30
    Width = 75
    Height = 25
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 1
  end
  object BitBtn2: TBitBtn
    Left = 278
    Top = 60
    Width = 75
    Height = 25
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
end
