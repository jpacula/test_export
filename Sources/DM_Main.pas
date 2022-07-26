unit DM_Main;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, MSAccess, MemDS;

type
  TDM = class(TDataModule)
    qEksport: TMSQuery;
    dbConn: TMSConnection;
    qLokale: TMSQuery;
    qEksportid: TIntegerField;
    qEksportnazwa_lokalu: TWideStringField;
    qLokalelokal: TWideStringField;
    qEksportnazwa_eksportu: TWideStringField;
    qEksportnazwa_uzytkownika: TStringField;
    qEksportdata_eksportu: TWideStringField;
    qEksportgodzina_eksportu: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
