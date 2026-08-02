program fluxocaixa;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, zcomponent, runtimetypeinfocontrols, uprincipal, uconfigurabanco,
  ucad_padrao, ucad_planoconta, udmConexao
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.Run;
end.

