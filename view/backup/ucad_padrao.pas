unit ucad_padrao;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls, ComCtrls, MaskEdit, udmConexao;

type

  TcliqueBotao = (cbIncluir,cbAlterar,cbNone);

  { Tfrmcad_padrao }

  Tfrmcad_padrao = class(TForm)
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    btnIncluir: TBitBtn;
    btnPesquisa: TBitBtn;
    btnSalvar: TBitBtn;
    edtPesquisa: TEdit;
    PageControl1: TPageControl;
    Panel1: TPanel;
    pnlrodape: TPanel;
    tsPesquisa: TTabSheet;
    tsCadastro: TTabSheet;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pnlRodapeClick(Sender: TObject);
    procedure tsPesquisaShow(Sender: TObject);
  private
     procedure edicao(habilita:boolean);
  public

  end;

var
  frmcad_padrao: Tfrmcad_padrao;
  cliquebotao : TcliqueBotao;

implementation

{$R *.lfm}

{ Tfrmcad_padrao }

procedure Tfrmcad_padrao.pnlRodapeClick(Sender: TObject);
begin

end;

procedure Tfrmcad_padrao.btnIncluirClick(Sender: TObject);
begin
  edicao(true);
  cliquebotao := cbIncluir;
end;

procedure Tfrmcad_padrao.btnSalvarClick(Sender: TObject);
begin
  edicao(false);
end;

procedure Tfrmcad_padrao.FormCreate(Sender: TObject);
begin
  btnSalvar.Visible   := false;
  btnCancelar.Visible := false;
end;

procedure Tfrmcad_padrao.btnAlterarClick(Sender: TObject);
begin
  edicao(true);
  cliquebotao:= cbAlterar;
end;

procedure Tfrmcad_padrao.btnCancelarClick(Sender: TObject);
begin
  edicao(false);
end;

procedure Tfrmcad_padrao.btnExcluirClick(Sender: TObject);
begin
  edicao(false);
end;

procedure Tfrmcad_padrao.tsPesquisaShow(Sender: TObject);
begin

end;

procedure Tfrmcad_padrao.edicao(habilita: boolean);
begin
  btnIncluir.Enabled  := not habilita;
  btnAlterar.Enabled  := not habilita;
  btnExcluir.Enabled  := not habilita;
  btnSalvar.Visible   := habilita;
  btnCancelar.Visible := habilita;
end;

end.

