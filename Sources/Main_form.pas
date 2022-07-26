unit Main_form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ExtCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxDBEdit, Vcl.ComCtrls, dxCore, cxDateUtils, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, cxCalendar, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxLabel;

type
  TMain_frm = class(TForm)
    pnlLeft: TPanel;
    grdvwEksport: TcxGridDBTableView;
    grdlvlEksport: TcxGridLevel;
    grdEksport: TcxGrid;
    dtpDataOd: TcxDateEdit;
    dtpDataDo: TcxDateEdit;
    btnZatwierdz: TcxButton;
    dsLokal: TDataSource;
    dsEksport: TDataSource;
    grdvwEksportnazwa_esportu: TcxGridDBColumn;
    grdvwEksportdata_eksportu: TcxGridDBColumn;
    grdvwEksportid_uzytkownika: TcxGridDBColumn;
    grdvwEksportnazwa_lokalu: TcxGridDBColumn;
    grdvwEksportgodzina_eksportu: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lkpLokal: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnZatwierdzClick(Sender: TObject);
  private
    function VerifyFilters: Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_frm: TMain_frm;

implementation

{$R *.dfm}
uses DM_MAin,  DBAccess, MSAccess, MemDS,DateUtils;

procedure TMain_frm.btnZatwierdzClick(Sender: TObject);
begin
  if not VerifyFilters() then
    abort;

  TMSQuery(dsEksport.DataSet).ParamByName('data_od').AsDate:=dtpDataOD.Date;
  TMSQuery(dsEksport.DataSet).ParamByName('data_do').AsDate:=incDay(dtpDataDo.Date,1);
  if VarIsNull( lkpLokal.EditValue) then
    TMSQuery(dsEksport.DataSet).ParamByName('nazwa_lokalu').Value:=''
  else
    TMSQuery(dsEksport.DataSet).ParamByName('nazwa_lokalu').Value:=lkpLokal.EditValue;

  if dsEksport.DataSet.Active then
    dsEksport.DataSet.Close;
  dsEksport.DataSet.Open;

end;

procedure TMain_frm.FormCreate(Sender: TObject);
begin
  if not dsLokal.DataSet.Active then
    dsLokal.DataSet.Open;

  dtpDataOd.Date:=trunc(now) - 60;
  dtpDataDo.Date:=trunc(now) ;
end;

function  TMain_frm.VerifyFilters(): Boolean;
begin
  result:=False;
  if dtpDataOd.Date  > dtpDataDo.Date then
     Application.MessageBox('"Data Od" musi byæ wieksza od "Data Do"'+#13+#10+'Popraw zakres dat ',
       'B³¹d zakresu dat', MB_OK + MB_ICONSTOP)
  else
  result:=True;
end;


end.
