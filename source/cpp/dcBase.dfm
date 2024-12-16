object dmBase: TdmBase
  Height = 585
  Width = 1048
  PixelsPerInch = 168
  object FDBatchMove: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 394
    Top = 318
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 144
    Top = 312
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\dgoni\Documents\Embarcadero\Studio\STARS_DB\DA' +
        'TA\A_Delaunay.sqlite'
      'DriverID=SQLite')
    Left = 400
    Top = 184
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    Left = 152
    Top = 168
  end
end
