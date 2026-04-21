object FormMaximums: TFormMaximums
  Left = 311
  Top = 150
  Caption = 'Maximum'
  ClientHeight = 506
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 13
  object BackPanel: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 434
    Align = alClient
    BorderWidth = 2
    TabOrder = 0
    ExplicitWidth = 438
    ExplicitHeight = 409
    object ListBox: TListBox
      Left = 3
      Top = 3
      Width = 440
      Height = 428
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListBoxClick
      ExplicitWidth = 432
      ExplicitHeight = 403
    end
    object EditMax: TEdit
      Left = 80
      Top = 144
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'EditMax'
    end
  end
  object panButtonBar: TPanel
    Left = 0
    Top = 465
    Width = 446
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 440
    ExplicitWidth = 438
    object panOKButton: TPanel
      Left = 341
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = 333
      object btnOK: TBitBtn
        Left = 10
        Top = 6
        Width = 75
        Height = 25
        Kind = bkOK
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object btnEdit: TBitBtn
      Left = 234
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Commit'
      Kind = bkHelp
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnDefaults: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Defaults'
      TabOrder = 2
      OnClick = btnDefaultsClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 434
    Width = 446
    Height = 31
    Align = alBottom
    Caption = 
      'Click on a Thing, enter a new value in the box below, then press' +
      ' the Commit button.'
    TabOrder = 2
    ExplicitTop = 409
    ExplicitWidth = 438
  end
end
