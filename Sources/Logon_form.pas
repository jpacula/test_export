unit Logon_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxMaskEdit, cxTextEdit, cxLabel;

type
  TLogon_frm = class(TForm)
    cxLabel1: TcxLabel;
    edtUser: TcxTextEdit;
    edtPassword: TcxMaskEdit;
    cxLabel2: TcxLabel;
    Panel1: TPanel;
    btnCancel: TcxButton;
    btnLogin: TcxButton;
    procedure btnLoginClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   class function LogToApp (): boolean;
  end;

var
  Logon_frm: TLogon_frm;

implementation

{$R *.dfm}
uses     UConnectionParams,DM_Main,MSClasses;

procedure TLogon_frm.btnCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

class function TLogon_frm.LogToApp (): boolean;
begin
  Logon_frm:=TLogon_frm.Create(nil);
  try
    Result:=Logon_frm.ShowModal=mrOk;
  finally
    Logon_frm.Free;
  end;
end;

procedure TLogon_frm.btnLoginClick(Sender: TObject);
var
  ErrMsg : String;
begin
  if DM.dbConn.Connected then
    DM.dbConn.Disconnect;
  ConnectionParams:=TConnectionParams.Create;

  DM.dbConn.Database:=ConnectionParams.DB;
  DM.dbConn.Server:=ConnectionParams.Server;
  DM.dbConn.Port:=ConnectionParams.Port;
  DM.dbConn.Authentication:=auServer;

  DM.dbConn.Username:=edtUser.Text;
  DM.dbConn.Password:=edtPassword.text;
  try
    try
      DM.dbConn.Connect;
      if Dm.dbConn.Connected then
        ModalResult:=mrOk
      else
        Application.MessageBox('Z³y u¿ytkownik lub has³o', 'B³¹d', MB_OK +
          MB_ICONSTOP);
    except
      on E: Exception do
      begin
        ErrMsg:= 'Nie uda³o sie polaczyæ z baza danych'+#13+#10+E.Message;
        Application.MessageBox(PChar(ErrMsg), 'B³¹d po³¹czenia do bazy danych',
       MB_OK + MB_ICONSTOP);
      end;
    end;
  finally
    ConnectionParams.Free
  end;
end;


end.
