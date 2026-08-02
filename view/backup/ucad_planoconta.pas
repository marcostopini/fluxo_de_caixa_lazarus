unit ucad_planoconta;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  DBGrids, ZDataset, ZAbstractRODataset, ucad_padrao, DB;

type

  { Tfrmcad_planoconta }

  Tfrmcad_planoconta = class(Tfrmcad_padrao)
    ComboBox1: TComboBox;
    dsPesquisa: TDataSource;
    DBGrid1: TDBGrid;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZqryPesquisa: TZQuery;
    ZqryPesquisadescricao: TZRawStringField;
    ZqryPesquisaid_plano: TZIntegerField;
    ZqryPesquisatipo: TZRawStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private

  public

  end;

var
  frmcad_planoconta: Tfrmcad_planoconta;

implementation

{$R *.lfm}

{ Tfrmcad_planoconta }

procedure Tfrmcad_planoconta.btnSalvarClick(Sender: TObject);
begin
  inherited;
end;

procedure Tfrmcad_planoconta.btnIncluirClick(Sender: TObject);
begin
  inherited;
end;

end.

