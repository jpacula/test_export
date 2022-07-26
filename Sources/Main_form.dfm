object Main_frm: TMain_frm
  Left = 0
  Top = 0
  Caption = 'Raport'
  ClientHeight = 465
  ClientWidth = 805
  Color = clBtnFace
  Constraints.MinHeight = 500
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 465
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 8
    object dtpDataOd: TcxDateEdit
      Left = 16
      Top = 111
      TabOrder = 0
      Width = 145
    end
    object dtpDataDo: TcxDateEdit
      Left = 16
      Top = 165
      TabOrder = 1
      Width = 145
    end
    object btnZatwierdz: TcxButton
      Left = 16
      Top = 424
      Width = 145
      Height = 25
      Caption = 'Zatwierd'#378
      TabOrder = 2
      OnClick = btnZatwierdzClick
    end
    object cxLabel1: TcxLabel
      Left = 16
      Top = 8
      Caption = 'Lokal:'
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 88
      Caption = 'Data od:'
    end
    object cxLabel3: TcxLabel
      Left = 16
      Top = 142
      Caption = 'Data do:'
    end
    object lkpLokal: TcxLookupComboBox
      Left = 16
      Top = 31
      Properties.ClearKey = 46
      Properties.KeyFieldNames = 'lokal'
      Properties.ListColumns = <
        item
          FieldName = 'lokal'
        end>
      Properties.ListSource = dsLokal
      Properties.ReadOnly = False
      TabOrder = 6
      Width = 145
    end
    object cxLabel4: TcxLabel
      Left = 14
      Top = 53
      Caption = '(Del '#380'eby wyczy'#347'ci'#263' )'
      Style.TextColor = clRed
    end
  end
  object grdEksport: TcxGrid
    Left = 185
    Top = 0
    Width = 620
    Height = 465
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 191
    object grdvwEksport: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = dsEksport
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object grdvwEksportnazwa_esportu: TcxGridDBColumn
        DataBinding.FieldName = 'nazwa_eksportu'
        Width = 126
      end
      object grdvwEksportdata_eksportu: TcxGridDBColumn
        DataBinding.FieldName = 'data_eksportu'
        Width = 143
      end
      object grdvwEksportgodzina_eksportu: TcxGridDBColumn
        DataBinding.FieldName = 'godzina_eksportu'
        Width = 116
      end
      object grdvwEksportid_uzytkownika: TcxGridDBColumn
        DataBinding.FieldName = 'nazwa_uzytkownika'
        Width = 103
      end
      object grdvwEksportnazwa_lokalu: TcxGridDBColumn
        DataBinding.FieldName = 'nazwa_lokalu'
        Width = 211
      end
    end
    object grdlvlEksport: TcxGridLevel
      GridView = grdvwEksport
    end
  end
  object dsLokal: TDataSource
    DataSet = DM.qLokale
    Left = 320
    Top = 96
  end
  object dsEksport: TDataSource
    DataSet = DM.qEksport
    Left = 320
    Top = 152
  end
end
