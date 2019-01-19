unit formProdutosEdicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Rest.Json,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formModeloEdicao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, classeProduto;

type
  TfrmProdutosEdicao = class(TfrmModeloEdicao)
    Label5: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtPreco: TEdit;
    procedure actSalvarInserirExecute(Sender: TObject);
    procedure actSalvarSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtPrecoExit(Sender: TObject);
  protected
    FProduto : TProduto;
  private
    { Private declarations }
    function Salvar:Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmProdutosEdicao: TfrmProdutosEdicao;

implementation

uses dmVendas;

{$R *.dfm}

procedure TfrmProdutosEdicao.actSalvarInserirExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    LimparCampos;
  edtNome.SetFocus;
end;

procedure TfrmProdutosEdicao.actSalvarSairExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    actSair.Execute;
end;


procedure TfrmProdutosEdicao.edtPrecoExit(Sender: TObject);
begin
  inherited;
  try
    StrToFloat(edtPreco.Text);
  except
    edtPreco.Text := '0,00';
    ShowMessage('Preço inválido.');
  end;
end;

procedure TfrmProdutosEdicao.FormCreate(Sender: TObject);
begin
  inherited;
  LimparCampos;
  FProduto := TProduto.Create;
end;

procedure TfrmProdutosEdicao.FormDestroy(Sender: TObject);
begin
  inherited;
  FProduto.Free;
end;

procedure TfrmProdutosEdicao.LimparCampos;
begin
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtPreco.Text := '0,00';
end;

function TfrmProdutosEdicao.Salvar: Boolean;
begin
  FProduto.Codigo := StrToInt(edtCodigo.Text);
  FProduto.Nome := edtNome.Text;
  FProduto.Preco := StrToFloat(edtPreco.Text);
  Result := dmConexao.ProdutoSalvar(FProduto);
end;

end.

