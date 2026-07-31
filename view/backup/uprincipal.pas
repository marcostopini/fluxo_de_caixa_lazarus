unit uprincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { Tfrmprincipal }

  Tfrmprincipal = class(TForm)
    btnContas: TBitBtn;
    btncfg: TBitBtn;
    btnPlanos: TBitBtn;
    btnLancamentos: TBitBtn;
    btnSair: TBitBtn;
    Label1: TLabel;
    pnpesquerda: TPanel;
    Shape1: TShape;
    procedure btncfgClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Ler_ini;
  public
  end;

var
  frmprincipal : Tfrmprincipal;
  cfg_arqINI   : string;
  cfg_pathApp  : string;
  cfg_banco    : string;
  cfg_servidor : string;
  cfg_usuario  : string;
  cfg_senha    : string;
  cfg_odbc     : string;
  cfg_porta    : integer;


implementation

uses uconfigurabanco, udmConexao, IniFiles ;

{$R *.lfm}

{ Tfrmprincipal }

procedure Tfrmprincipal.FormCreate(Sender: TObject);
begin
  {$IFDEF LINUX}
     // Formatação de moeda
      CurrencyString := 'R$';
      CurrencyFormat := 2;
      DecimalSeparator := ',';
      ThousandSeparator := '.';
     // Formatação de datas
      DateSeparator := '/';
      ShortDateFormat := 'dd/mm/yyyy';
    {$ENDIF}
    cfg_arqINI  := ChangeFileExt(ParamStr(0),'.ini');
    cfg_pathApp := ExtractFilePath(ParamStr(0));

end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
begin
  if not FileExists(cfg_arqINI) then
    btncfg.Click;

  Ler_ini;;

  try
    DmConexao.Conexao.Connect;
    ShowMessage('Banco de dados Conectado!');
  except
    on e: exception do
      ShowMessage('Erro ao conecar no banco' + sLineBreak +
                  e.ClassName + sLineBreak + e.Message);
  end;

end;

procedure Tfrmprincipal.btnSairClick(Sender: TObject);
begin
  ShowMessage('Até Breve !');
  Application.Terminate;
end;

procedure Tfrmprincipal.btncfgClick(Sender: TObject);
begin
  frmconfigurabanco := Tfrmconfigurabanco.Create(self);
  try
    frmconfigurabanco.ShowModal;
  finally
    FreeAndNil(frmconfigurabanco);
  end;
end;

procedure Tfrmprincipal.Ler_ini;
var
  ArqIni : TIniFile;
begin
  ArqIni := TIniFile.Create(cfg_arqINI);
  try
    cfg_banco    := ArqIni.ReadString('ConexaoDB','Banco','');
    cfg_servidor := ArqIni.ReadString('ConexaoDB','Servidor','localhost');
    cfg_porta    := ArqIni.ReadInteger('ConexaoDB','Porta',3306);
    cfg_usuario  := ArqIni.ReadString('ConexaoDB','Usuario','suporte');
    cfg_senha    := ArqIni.ReadString('ConexaoDB','Senha','Info@1234');
    cfg_odbc     := ArqIni.ReadString('ConexaoDB','Odbc','mariadb ODBC 3.1 Driver');
  finally
    ArqIni.Free;
  end;
end;


end.

