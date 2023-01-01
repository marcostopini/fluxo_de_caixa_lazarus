unit udmConexao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, ZConnection;

type

  { TDmConexao }

  TDmConexao = class(TDataModule)
    Conexao: TZConnection;
    procedure ConexaoBeforeConnect(Sender: TObject);
  private

  public

  end;

var
  DmConexao: TDmConexao;

implementation
uses uprincipal;

{$R *.lfm}

{ TDmConexao }

procedure TDmConexao.ConexaoBeforeConnect(Sender: TObject);
begin
  Conexao.Database   := cfg_banco;
  Conexao.HostName   := cfg_servidor;
  Conexao.User       := cfg_usuario;
  Conexao.Password   := cfg_senha;
  Conexao.Port       := cfg_porta;
  Conexao.AutoCommit := true;
  {$IFDEF windows}
    if cfg_odbc = EmptyStr then
      Conexao.LibraryLocation :=  cfg_pathApp + 'libmariadb.dll'
    else
      begin
        conexao.Protocol:= 'ado';
        Conexao.Database:= 'Driver={'+cfg_odbc +'}; server='+cfg_servidor+'; Database='+cfg_banco+'; User='+cfg_usuario+'; password='+cfg_senha+'; option=3;';
      end;
  {$EndIf}

end;

end.

