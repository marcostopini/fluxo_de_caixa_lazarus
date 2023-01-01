unit uconfigurabanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  RTTICtrls;

type

  { Tfrmconfigurabanco }

  Tfrmconfigurabanco = class(TForm)
    edtBanco: TEdit;
    edtPorta: TEdit;
    edtOdbc: TEdit;
    edtSevidor: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Shape1: TShape;
    btnsalvar: TTIButton;
    btncancelar: TTIButton;
    procedure btncancelarClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Salva_ini;
    procedure Ler_ini;

  end;

var
  frmconfigurabanco: Tfrmconfigurabanco;

implementation
uses uprincipal,IniFiles;

{$R *.lfm}

{ Tfrmconfigurabanco }

procedure Tfrmconfigurabanco.btnsalvarClick(Sender: TObject);
begin
  Salva_ini;
  Close;
end;

procedure Tfrmconfigurabanco.btncancelarClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrmconfigurabanco.FormShow(Sender: TObject);
begin
  Ler_ini;
end;

procedure Tfrmconfigurabanco.Salva_ini;
var
  ArqIni : TIniFile;
begin
  try
    ArqIni := TIniFile.Create(cfg_arqINI);
    ArqIni.WriteString ('ConexaoDB','Banco'   ,edtBanco.Text);
    ArqIni.WriteString ('ConexaoDB','Servidor',edtSevidor.Text);
    ArqIni.WriteInteger('ConexaoDB','Porta'   ,StrToIntDef(edtPorta.Text,3306));
    ArqIni.WriteString ('ConexaoDB','Usuario' ,edtUsuario.Text);
    ArqIni.WriteString ('ConexaoDB','Senha'   ,edtSenha.Text);
    ArqIni.WriteString ('ConexaoDB','Odbc'   ,edtOdbc.Text);

  finally
    ArqIni.Free;
  end;
end;

procedure Tfrmconfigurabanco.Ler_ini;
var
  ArqIni : TIniFile;
begin
  try
    ArqIni := TIniFile.Create(cfg_arqINI);
    edtBanco.Text   := ArqIni.ReadString('ConexaoDB','Banco','fluxo_caixa');
    edtSevidor.Text := ArqIni.ReadString('ConexaoDB','Servidor','localhost');
    edtPorta.Text   := IntToStr(ArqIni.ReadInteger('ConexaoDB','Porta',3306));
    edtUsuario.Text := ArqIni.ReadString('ConexaoDB','Usuario','suporte');
    edtSenha.Text   := ArqIni.ReadString('ConexaoDB','Senha','Info@1234');
    edtOdbc.Text    := ArqIni.ReadString('ConexaoDB','Odbc','mariadb ODBC 3.1 Driver');
  finally
    ArqIni.Free;
  end;
end;


end.

