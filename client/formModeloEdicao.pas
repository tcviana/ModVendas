unit formModeloEdicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls;

type
  TfrmModeloEdicao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ActionList1: TActionList;
    actSalvarInserir: TAction;
    actSalvarSair: TAction;
    actSair: TAction;
    btnSalvarInserir: TButton;
    btnSalvarSair: TButton;
    btnSair: TButton;
    procedure actSairExecute(Sender: TObject);
  private
    { Private declarations }
    function Salvar:Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmModeloEdicao: TfrmModeloEdicao;

implementation

{$R *.dfm}

procedure TfrmModeloEdicao.actSairExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmModeloEdicao.LimparCampos;
begin
  // limpa campos da tela
end;

function TfrmModeloEdicao.Salvar: Boolean;
begin
  // salvar
end;

end.
