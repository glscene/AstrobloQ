object FormMaximums: TFormMaximums
  Left = 311
  Top = 150
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Maximums'
  ClientHeight = 886
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object BackPanel: TPanel
    Left = 0
    Top = 0
    Width = 788
    Height = 760
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BorderWidth = 2
    TabOrder = 0
    object ListBox: TListBox
      Left = 3
      Top = 3
      Width = 782
      Height = 754
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      ItemHeight = 24
      TabOrder = 0
      OnClick = ListBoxClick
    end
    object EditMax: TEdit
      Left = 140
      Top = 252
      Width = 212
      Height = 32
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = 'EditMax'
    end
  end
  object panButtonBar: TPanel
    Left = 0
    Top = 814
    Width = 788
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object panOKButton: TPanel
      Left = 605
      Top = 1
      Width = 182
      Height = 70
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object btnOK: TBitBtn
        Left = 18
        Top = 11
        Width = 131
        Height = 43
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object btnEdit: TBitBtn
      Left = 410
      Top = 14
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '&Commit'
      Kind = bkHelp
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDefaults: TBitBtn
      Left = 28
      Top = 14
      Width = 131
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Defaults'
      TabOrder = 2
      OnClick = btnDefaultsClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 760
    Width = 788
    Height = 54
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    Caption = 
      'Click on a Thing, enter a new value in the box below, then press' +
      ' the Commit button.'
    TabOrder = 2
  end
end
