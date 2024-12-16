object dmDialogs: TdmDialogs
  Height = 707
  Width = 1057
  PixelsPerInch = 168
  object SavePictureDialog: TSavePictureDialog
    Left = 416
    Top = 336
  end
  object OpenPictureDialog: TOpenPictureDialog
    Left = 120
    Top = 328
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    Left = 418
    Top = 186
  end
  object OpenTextFileDialog: TOpenTextFileDialog
    Filter = 
      'Data with coma (*.csv)|*.csv|Data with space (*.dat)|*.dat|All (' +
      '*.*)|*.*'
    Encodings.Strings = (
      'ASCII'
      'ANSI'
      'Unicode'
      'Big Endian Unicode'
      'UTF-8'
      'UTF-7')
    Left = 123
    Top = 196
  end
  object SaveDialog: TSaveDialog
    Left = 416
    Top = 64
  end
  object OpenDialog: TOpenDialog
    Left = 128
    Top = 64
  end
end
