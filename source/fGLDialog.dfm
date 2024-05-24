inherited GLDialog: TGLDialog
  BorderIcons = [biSystemMenu]
  ClientHeight = 500
  ClientWidth = 708
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 724
  ExplicitHeight = 539
  TextHeight = 30
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 35
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 700
  end
  object PanelMiddle: TPanel
    Left = 0
    Top = 35
    Width = 708
    Height = 424
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 700
    ExplicitHeight = 399
    object Memo: TMemo
      Left = 1
      Top = 1
      Width = 706
      Height = 422
      Align = alClient
      Lines.Strings = (
        ''
        ''
        '')
      TabOrder = 0
      ExplicitWidth = 698
      ExplicitHeight = 397
    end
  end
  object PanelBottom: TPanel
    Left = 0
    Top = 459
    Width = 708
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitTop = 434
    ExplicitWidth = 700
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
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object ButtonHelp: TButton
      Left = 360
      Top = 6
      Width = 89
      Height = 25
      Caption = #1057#1087#1088#1072#1074#1082#1072
      ModalResult = 9
      TabOrder = 2
      OnClick = ButtonHelpClick
    end
  end
end
