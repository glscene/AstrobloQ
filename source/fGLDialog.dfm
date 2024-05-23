inherited GLDialog: TGLDialog
  BorderIcons = [biSystemMenu]
  ClientHeight = 469
  ClientWidth = 664
  StyleElements = [seFont, seClient, seBorder]
  ExplicitLeft = 4
  ExplicitTop = 4
  ExplicitWidth = 680
  ExplicitHeight = 508
  TextHeight = 20
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 35
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 476
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 35
    Width = 664
    Height = 393
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 476
    ExplicitHeight = 261
    object Memo: TMemo
      Left = 1
      Top = 1
      Width = 662
      Height = 391
      Align = alClient
      Lines.Strings = (
        ''
        ''
        '')
      TabOrder = 0
      ExplicitWidth = 474
      ExplicitHeight = 259
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 428
    Width = 664
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 296
    ExplicitWidth = 476
    object ButtonOK: TButton
      Left = 144
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TButton
      Left = 256
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonHelp: TButton
      Left = 360
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Help'
      TabOrder = 2
      OnClick = ButtonHelpClick
    end
  end
end
