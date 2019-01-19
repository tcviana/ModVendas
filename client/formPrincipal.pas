unit formPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, System.Actions, Vcl.ActnList, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    ActionList1: TActionList;
    actClientes: TAction;
    actProdutos: TAction;
    actVendas: TAction;
    actSair: TAction;
    Button4: TButton;
    Button5: TButton;
    actSobre: TAction;
    procedure actVendasExecute(Sender: TObject);
    procedure actProdutosExecute(Sender: TObject);
    procedure actClientesExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);
    procedure actSobreExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses formVendas,formClientes,formProdutos,formSobre, dmVendas;

procedure TfrmPrincipal.actClientesExecute(Sender: TObject);
begin
  Self.Hide;
  // abrir tela de pessoas
  frmClientes := TFrmClientes.Create(Self);
  try
    frmClientes.ShowModal;
  finally
    frmClientes.Free;
    Self.Show;
  end;
end;

procedure TfrmPrincipal.actProdutosExecute(Sender: TObject);
begin
  Self.Hide;
  // abrir tela de produtos
  frmProdutos := TFrmProdutos.Create(Self);
  try
    frmProdutos.ShowModal;
  finally
    frmProdutos.Free;
    Self.Show;
  end;
end;

procedure TfrmPrincipal.actSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPrincipal.actSobreExecute(Sender: TObject);
begin
  Self.Hide;
  // abrir tela de produtos
  frmSobre := TFrmSobre.Create(Self);
  try
    frmSobre.ShowModal;
  finally
    frmSobre.Free;
    Self.Show;
  end;
end;

procedure TfrmPrincipal.actVendasExecute(Sender: TObject);
begin
  Self.Hide;
  // abrir tela de vendas
  frmVendas := TFrmVendas.Create(Self);
  try
    frmVendas.ShowModal;
  finally
    frmVendas.Free;
    Self.Show;
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  try
    dmConexao.conServer.TestConnection;
  except
    Close;
  end;
end;

end.
