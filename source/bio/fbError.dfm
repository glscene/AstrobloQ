object FormError: TFormError
  Left = 322
  Top = 166
  Caption = 'BioSphere Error!'
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
    Caption = 
      'BioSphere has crashed.  Sorry for the inconvenience. Please foll' +
      'ow the steps below to report the error.'
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 257
    Width = 613
    Height = 121
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 78
      Width = 336
      Height = 13
      Caption = 
        'STEP THREE: Optional, visit the repository to clone more fresh v' +
        'ersion:'
    end
    object Label2: TLabel
      Left = 38
      Top = 93
      Width = 199
      Height = 13
      Cursor = crHandPoint
      Caption = 'https://gitflic.ru/project/glscene/astrobloq'
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
      Width = 446
      Height = 13
      Caption = 
        'STEP TWO: Send a message to the link below, and paste there info' +
        'rmation by pressing Ctrl+V.'
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
      Width = 294
      Height = 13
      Caption = 'STEP ONE: Copy the text in the above box by pressing Ctrl+C.'
    end
    object Label6: TLabel
      Left = 10
      Top = 6
      Width = 87
      Height = 13
      Caption = 'Error Reporting'
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
    object memReport: TMemo
      Left = 6
      Top = 6
      Width = 609
      Height = 229
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
    object Button4: TButton
      Left = 494
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Close'
      TabOrder = 0
      OnClick = Button4Click
    end
    object btnSaveWorld: TBitBtn
      Left = 10
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Save World'
      TabOrder = 1
      OnClick = btnSaveWorldClick
    end
  end
end
