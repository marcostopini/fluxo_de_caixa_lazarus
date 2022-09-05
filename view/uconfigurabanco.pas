unit uconfigurabanco;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  RTTICtrls;

type

  { Tfrmconfigurabanco }

  Tfrmconfigurabanco = class(TForm)
    edtporta: TEdit;
    edtusuario: TLabeledEdit;
    edtservidor: TLabeledEdit;
    edtsenha: TLabeledEdit;
    Label1: TLabel;
    edi: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    btnsalva: TTIButton;
    btncancela: TTIButton;
  private

  public

  end;

var
  frmconfigurabanco: Tfrmconfigurabanco;

implementation

{$R *.lfm}

end.

