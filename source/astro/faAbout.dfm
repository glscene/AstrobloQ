object AboutForm: TAboutForm
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 467
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  PixelsPerInch = 168
  TextHeight = 23
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 99
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Caption = 'PLOTSTARS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 392
    Width = 749
    Height = 75
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    Caption = #169' OOO "GalabloQ", 2020-2024'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -23
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object PanelCentre: TPanel
    Left = 0
    Top = 99
    Width = 749
    Height = 293
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    Caption = ' '
    TabOrder = 2
    ExplicitTop = 130
    ExplicitHeight = 262
    object MemoContributors: TMemo
      Left = 126
      Top = 110
      Width = 464
      Height = 101
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      Lines.Strings = (
        'Pavel Vassiliev'
        'Lev Koptyaev'
        'Eric Hardinger'
        'Danil Wasilyev')
      TabOrder = 0
      Visible = False
    end
    object Button1: TButton
      Left = 182
      Top = 40
      Width = 352
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Developers and Contributors'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
end
