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
  private

  public

  end;

var
  frmprincipal: Tfrmprincipal;

implementation

uses uconfigurabanco;

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
    //cfg_arqINI := ChangeFileExt(ParamStr(0),'.ini');
    //cfg_pathApp:= ExtractFilePath(ParamStr(0));
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

end.

