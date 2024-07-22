object FormError: TFormError
  Left = 322
  Top = 166
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'BioSphere Error!'
  ClientHeight = 733
  ClientWidth = 1073
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 168
  TextHeight = 24
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1073
    Height = 72
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alTop
    Alignment = taLeftJustify
    BorderWidth = 10
    Caption = 
      'BioSphere has crashed.  Sorry for the inconvenience. Please foll' +
      'ow the steps below to report the error.'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 450
    Width = 1073
    Height = 212
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 21
      Top = 137
      Width = 595
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 
        'STEP THREE: Optional, visit the repository to clone more fresh v' +
        'ersion:'
    end
    object Label2: TLabel
      Left = 67
      Top = 163
      Width = 353
      Height = 24
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'https://gitflic.ru/project/glscene/terraplanets'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentColor = False
      ParentFont = False
      OnClick = Label2Click
    end
    object Label3: TLabel
      Left = 21
      Top = 77
      Width = 791
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 
        'STEP TWO: Send a message to the link below, and paste there info' +
        'rmation by pressing Ctrl+V.'
    end
    object Label4: TLabel
      Left = 67
      Top = 105
      Width = 162
      Height = 24
      Cursor = crHandPoint
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'https://t.me/glscene'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = Label4Click
    end
    object Label5: TLabel
      Left = 21
      Top = 42
      Width = 523
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'STEP ONE: Copy the text in the above box by pressing Ctrl+C.'
    end
    object Label6: TLabel
      Left = 18
      Top = 11
      Width = 145
      Height = 24
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Error Reporting'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 72
    Width = 1073
    Height = 378
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alClient
    BorderWidth = 5
    TabOrder = 2
    object memReport: TMemo
      Left = 6
      Top = 6
      Width = 1061
      Height = 366
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alClient
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
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
    Top = 662
    Width = 1073
    Height = 71
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Align = alBottom
    TabOrder = 3
    object Button4: TButton
      Left = 865
      Top = 14
      Width = 173
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button4Click
    end
    object btnSaveWorld: TBitBtn
      Left = 18
      Top = 14
      Width = 173
      Height = 44
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Save World'
      TabOrder = 1
      OnClick = btnSaveWorldClick
    end
  end
end
