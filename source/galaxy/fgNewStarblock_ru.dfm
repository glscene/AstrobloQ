object frmNewStarblock: TfrmNewStarblock
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1089#1090#1072#1088#1073#1083#1086#1082
  ClientHeight = 633
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object PanelRight: TPanel
    Left = 799
    Top = 0
    Width = 247
    Height = 633
    Align = alRight
    Caption = 'PanelRight'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 776
    ExplicitHeight = 691
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 799
    Height = 633
    Buffer.BackgroundColor = clBlack
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
  end
  object GLScene1: TGLScene
    Left = 176
    Top = 104
  end
  object GLCadencer1: TGLCadencer
    Left = 176
    Top = 176
  end
  object GLAsyncTimer1: TGLAsyncTimer
    Left = 312
    Top = 104
  end
  object Timer1: TTimer
    Left = 640
    Top = 104
  end
  object MainMenu1: TMainMenu
    Left = 640
    Top = 176
    object miFile: TMenuItem
      Caption = #1060#1072#1081#1083
      object miOpen: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100'...'
      end
      object miSaveAs: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      end
    end
  end
end
