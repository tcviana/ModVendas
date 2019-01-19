program ModuloVendas;

uses
  Forms,
  formPrincipal in 'formPrincipal.pas' {frmPrincipal},
  classeCliente in '..\classes\classeCliente.pas',
  classePessoa in '..\classes\classePessoa.pas',
  classeProduto in '..\classes\classeProduto.pas',
  classeVenda in '..\classes\classeVenda.pas',
  classeVendaItem in '..\classes\classeVendaItem.pas',
  formModelo in 'formModelo.pas' {frmModelo},
  formClientes in 'formClientes.pas' {frmClientes},
  formProdutos in 'formProdutos.pas' {frmProdutos},
  formVendas in 'formVendas.pas' {frmVendas},
  formModeloEdicao in 'formModeloEdicao.pas' {frmModeloEdicao},
  formClientesEdicao in 'formClientesEdicao.pas' {frmClientesEdicao},
  formProdutosEdicao in 'formProdutosEdicao.pas' {frmProdutosEdicao},
  formVendasItens in 'formVendasItens.pas' {frmVendasItens},
  formPesquisa in 'formPesquisa.pas' {frmPesquisa},
  formSobre in 'formSobre.pas' {frmSobre},
  dmVendas in 'dmVendas.pas' {dmConexao: TDataModule},
  classeProxy in 'classeProxy.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
