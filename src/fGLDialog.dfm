inherited FormGLDialog: TFormGLDialog
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 803
  ExplicitHeight = 574
  TextHeight = 30
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 787
    Height = 35
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 779
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 35
    Width = 787
    Height = 459
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 779
    ExplicitHeight = 434
    object Memo: TMemo
      Left = 1
      Top = 1
      Width = 785
      Height = 457
      Align = alClient
      Lines.Strings = (
        ''
        ''
        '')
      TabOrder = 0
      ExplicitWidth = 777
      ExplicitHeight = 432
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 494
    Width = 787
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 469
    ExplicitWidth = 779
    object ButtonOK: TButton
      Left = 592
      Top = 6
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object ButtonCancel: TButton
      Left = 452
      Top = 6
      Width = 75
      Height = 25
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
end
