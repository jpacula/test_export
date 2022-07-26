unit UConnectionParams;



interface
type
  TConnectionParams = class (Tobject)
  private
    fServer :string;
    fDB    :string;
    fPort : integer;
  public
    constructor Create (); overload;

    property Server:string read  fServer write fServer;
    property DB    :string  read  fDB     write fDB    ;
    property Port  :integer read  fPort   write fPort  ;


end;
var ConnectionParams:TConnectionParams;


implementation
uses SysUtils,Forms,IniFiles;

 constructor TConnectionParams.Create ();
 var
  SettingsIni: TIniFile;
 begin
   inherited;
   SettingsIni:=TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
   try
     fServer:= SettingsIni.ReadString('ConnectionParams','Server','localhost');
     fDB:=SettingsIni.ReadString('ConnectionParams','Database','TPStockDB');
     fPort:=SettingsIni.ReadInteger('ConnectionParams','Port',1433);
   finally
     SettingsIni.Free;
   end;
 end;
end.
