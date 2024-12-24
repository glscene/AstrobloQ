object DataModuleBase: TDataModuleBase
  Height = 649
  Width = 983
  PixelsPerInch = 168
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
  object FDBatchMove: TFDBatchMove
    Mappings = <>
    LogFileName = 'Data.log'
    Left = 394
    Top = 318
  end
end
