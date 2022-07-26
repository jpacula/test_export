object Logon_frm: TLogon_frm
  Left = 0
  Top = 0
  Caption = 'Wpisz Dane logowania '
  ClientHeight = 122
  ClientWidth = 264
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 8
    Top = 17
    Caption = 'Login:'
  end
  object edtUser: TcxTextEdit
    Left = 47
    Top = 16
    TabOrder = 1
    Width = 171
  end
  object edtPassword: TcxMaskEdit
    Left = 49
    Top = 43
    ParentColor = True
    Properties.EchoMode = eemPassword
    TabOrder = 2
    Width = 171
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 44
    Caption = 'Has'#322'o:'
  end
  object Panel1: TPanel
    Left = 0
    Top = 81
    Width = 264
    Height = 41
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 82
    ExplicitWidth = 228
    DesignSize = (
      264
      41)
    object btnCancel: TcxButton
      Left = 93
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Anuluj'
      TabOrder = 0
      OnClick = btnCancelClick
      ExplicitLeft = 57
    end
    object btnLogin: TcxButton
      Left = 174
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Zaloguj'
      TabOrder = 1
      OnClick = btnLoginClick
      ExplicitLeft = 138
    end
  end
end
