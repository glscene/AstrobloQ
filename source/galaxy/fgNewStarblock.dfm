object frmNewStarblock: TfrmNewStarblock
  Left = 0
  Top = 0
  Caption = 'New starblock'
  ClientHeight = 591
  ClientWidth = 963
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
    Left = 716
    Top = 0
    Width = 247
    Height = 591
    Align = alRight
    Caption = 'PanelRight'
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 644
    ExplicitTop = -72
    ExplicitHeight = 633
  end
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 716
    Height = 591
    Buffer.BackgroundColor = clBlack
    PenAsTouch = False
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 644
    ExplicitHeight = 528
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
      Caption = 'File'
      object miOpen: TMenuItem
        Caption = 'Open...'
      end
      object miSaveAs: TMenuItem
        Caption = 'Save as...'
      end
    end
  end
end
