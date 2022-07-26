object DM: TDM
  OldCreateOrder = False
  Height = 150
  Width = 215
  object qEksport: TMSQuery
    Connection = dbConn
    SQL.Strings = (
      'Select'
      '  id'
      ' ,nazwa_eksportu'
      ' ,cast (data_eksportu as date) as data_eksportu'
      ' --,cast (data_eksportu as time) as godzina_eksportu'
      
        ' ,cast (DATEPART(hour,data_eksportu) as nvarchar) +'#39':00'#39'  as  go' +
        'dzina_eksportu'
      ' ,nazwa_uzytkownika'
      ' ,nazwa_lokalu'
      'from [dbo].[eksport_danych]'
      'where data_eksportu >= :data_od '
      'and   data_eksportu < :data_do '
      'and  nazwa_lokalu='
      'case when :nazwa_lokalu ='#39#39' then nazwa_lokalu'
      'else :nazwa_lokalu end;')
    ReadOnly = True
    Left = 96
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_od'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'data_do'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'nazwa_lokalu'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'nazwa_lokalu'
        Value = nil
      end>
    object qEksportid: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'id'
      ReadOnly = True
    end
    object qEksportnazwa_eksportu: TWideStringField
      DisplayLabel = 'Nazwa'
      FieldName = 'nazwa_eksportu'
      Size = 50
    end
    object qEksportdata_eksportu: TWideStringField
      DisplayLabel = 'Data'
      FieldName = 'data_eksportu'
      ReadOnly = True
      Size = 10
    end
    object qEksportnazwa_uzytkownika: TStringField
      DisplayLabel = 'U'#380'ytkownik'
      FieldName = 'nazwa_uzytkownika'
      Size = 100
    end
    object qEksportnazwa_lokalu: TWideStringField
      DisplayLabel = 'Lokal'
      FieldName = 'nazwa_lokalu'
      Size = 100
    end
    object qEksportgodzina_eksportu: TWideStringField
      DisplayLabel = 'Godzina'
      FieldName = 'godzina_eksportu'
      ReadOnly = True
      Size = 33
    end
  end
  object dbConn: TMSConnection
    Database = 'Test_eksport'
    Options.PersistSecurityInfo = True
    Options.Provider = prSQL
    Username = 'sa'
    Server = 'localhost'
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 40
    EncryptedPassword = 'AFFF9AFF8FFF9CFF90FFCDFFCFFFCEFFC9FF8CFF8AFF'
  end
  object qLokale: TMSQuery
    Connection = dbConn
    SQL.Strings = (
      
        'Select distinct nazwa_lokalu as lokal  from [dbo].[eksport_danyc' +
        'h]')
    ReadOnly = True
    Left = 160
    Top = 40
    object qLokalelokal: TWideStringField
      DisplayLabel = 'Lokal'
      FieldName = 'lokal'
      Size = 100
    end
  end
end
