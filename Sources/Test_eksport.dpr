program Test_eksport;

uses
  Vcl.Forms,
  Main_form in 'Main_form.pas' {Main_frm},
  DM_Main in 'DM_Main.pas' {DM: TDataModule},
  UConnectionParams in 'UConnectionParams.pas',
  Logon_form in 'Logon_form.pas' {Logon_frm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  if TLogon_frm.LogToApp then
  begin
    Application.CreateForm(TMain_frm, Main_frm);
    Application.Run;
  end;
  Application.Run;
end.
