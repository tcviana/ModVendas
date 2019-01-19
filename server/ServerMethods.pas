unit ServerMethods;

interface

uses System.SysUtils, System.Classes, System.Json, Data.FireDACJSONReflect,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.VCLUI.Error,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Stan.StorageBin, FireDAC.Phys.ODBCBase, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, classeCliente, classeProduto, classeVenda,
  classeVendaItem, REST.Json;

type
{$METHODINFO ON}
  TSM = class(TDataModule)
    fdConexao: TFDConnection;
    fdTransacao: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDGUIxErrorDialog1: TFDGUIxErrorDialog;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TFDAutoIncField;
    qryClientesNOME: TStringField;
    qryClientesDATA_NASCIMENTO: TDateField;
    qryClientesCPF: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesTELEFONE: TStringField;
    qryProdutos: TFDQuery;
    qryProdutosCODIGO: TFDAutoIncField;
    qryProdutosNOME: TStringField;
    qryProdutosPRECO: TBCDField;
    qryVendas: TFDQuery;
    qryVendasCODIGO: TFDAutoIncField;
    qryVendasDATA_ABERTURA: TDateField;
    qryVendasCLIENTE_CODIGO: TIntegerField;
    qryVendasCliente: TStringField;
    qryVendasCPF: TStringField;
    qryVendasVALOR: TBCDField;
    qryVendasItens: TFDQuery;
    qryVendasItensCODIGO: TFDAutoIncField;
    qryVendasItensITEM: TIntegerField;
    qryVendasItensQUANTIDADE: TIntegerField;
    qryVendasItensVENDAS_CODIGO: TIntegerField;
    qryVendasItensPRODUTOS_CODIGO: TIntegerField;
    qryVendasItensPRECO: TBCDField;
    qryVendasItensProduto: TStringField;
    qryGeral: TFDQuery;
    FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink;
    FDStanStorageBinLink: TFDStanStorageBinLink;
    cmdGeral: TFDCommand;
    procedure DataModuleCreate(Sender: TObject);
  protected
    FCliente:TCliente;
    FProduto:TProduto;
    FVenda:TVenda;
    FVendaItem:TVendaItem;
  private
    { Private declarations }
    // cliente
    function ClienteAtualizar:Boolean;
    function ClienteInserir:Boolean;
    function ClienteValidarCPF:Boolean;
    function ClienteValidarRemocao(pCodigo:Integer):Boolean;
    // produto
    function ProdutoAtualizar:Boolean;
    function ProdutoInserir:Boolean;
    function ProdutoValidarNome:Boolean;
    function ProdutoValidarRemocao(pCodigo:Integer):Boolean;
    // venda
    function VendaAtualizar:Boolean;
    function VendaInserir:Boolean;
    // itens
    procedure VendaItemSalvar();

    function ExecutarComando:Boolean;

  public
    { Public declarations }
    // geral
    function RetornaUltimoCodigo(pTabela:string):Integer;
    function PesquisarQuery(pValue:string):TFDJSONDataSets;
    // clientes
    function PesquisarClientes(pValue:string):TFDJSONDataSets;
    function PesquisarClienteCodigo(pValue:Integer):TFDJSONDataSets;
    function ClienteSalvar(pJson:string): Boolean;
    function ClienteRemover(pCodigo:Integer):Boolean;
    function GetCliente(pValue: string):TFDJSONDataSets;
    // produtos
    function PesquisarProdutos(pValue:string):TFDJSONDataSets;
    function PesquisarProdutoCodigo(pValue:Integer):TFDJSONDataSets;
    function ProdutoSalvar(pJson:string): Boolean;
    function ProdutoRemover(pCodigo:Integer):Boolean;
    // vendas
    function PesquisarVendas(pValue:string;pDtInicial,pDtFinal:TDateTime):TFDJSONDataSets;
    function PesquisarVendaCodigo(pValue:Integer):TFDJSONDataSets;
    function VendaSalvar(pJson:string):Boolean;
    function VendaRemover(pCodigo:Integer):Boolean;
    // vendas itens
    function PesquisarVendasItens(pVenda:Integer):TFDJSONDataSets;
    procedure VendaItemRemover(pVenda:Integer);

    function Test():string;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
  end;
{$METHODINFO OFF}

implementation


{$R *.dfm}


uses System.StrUtils;

function TSM.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TSM.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TSM.ClienteAtualizar: Boolean;
begin
  if ClienteValidarCPF then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'UPDATE CLIENTES SET '+
      'NOME = :pNome, '+
      'DATA_NASCIMENTO = :pNascimento, '+
      'CPF = :pCPF, '+
      'EMAIL = :pEmail, '+
      'TELEFONE = :pTelefone '+
      'WHERE CODIGO = :pCodigo ');
    cmdGeral.ParamByName('pNome').AsString := FCliente.Nome;
    cmdGeral.ParamByName('pNascimento').AsDate := FCliente.DataNascimento;
    cmdGeral.ParamByName('pCPF').AsString := FCliente.CPF;
    cmdGeral.ParamByName('pCodigo').AsInteger := FCliente.Codigo;
    cmdGeral.ParamByName('pEmail').AsString := FCliente.Email;
    cmdGeral.ParamByName('pTelefone').AsString := FCliente.Telefone;
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ClienteInserir: Boolean;
begin
  if ClienteValidarCPF then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'INSERT INTO CLIENTES (NOME,DATA_NASCIMENTO,CPF,EMAIL,TELEFONE) '+
      'VALUES (:pNome,:pNascimento,:pCpf,:pEmail,:pTelefone); ');
    cmdGeral.ParamByName('pNome').AsString := FCliente.Nome;
    cmdGeral.ParamByName('pNascimento').AsDate := FCliente.DataNascimento;
    cmdGeral.ParamByName('pCPF').AsString := FCliente.CPF;
    cmdGeral.ParamByName('pEmail').AsString := FCliente.Email;
    cmdGeral.ParamByName('pTelefone').AsString := FCliente.Telefone;
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ClienteRemover(pCodigo:Integer): Boolean;
begin
  if ClienteValidarRemocao(pCodigo) then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'DELETE FROM CLIENTES WHERE CODIGO = '+IntToStr(pCodigo));
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ClienteSalvar(pJson:string): Boolean;
begin
  FCliente := TJson.JsonToObject<TCliente>(pJson);
  if FCliente.Codigo = 0 then
    Result := ClienteInserir
  else
    Result := ClienteAtualizar;
end;

function TSM.ClienteValidarCPF: Boolean;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(
    'SELECT CODIGO FROM CLIENTES WHERE '+
    'CPF = '+QuotedStr(FCliente.CPF));
  if FCliente.Codigo > 0 then
    qryGeral.SQL.Add('AND CODIGO <> '+IntToStr(FCliente.Codigo));
  qryGeral.Open;
  if qryGeral.IsEmpty then
    Result := True
  else
  begin
    Result := False;
    raise Exception.Create('CPF já cadastrado.');
  end;
  qryGeral.Close;
end;

function TSM.ClienteValidarRemocao(pCodigo:Integer):Boolean;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(
    'SELECT TOP 1 CODIGO FROM VENDAS WHERE '+
    'CLIENTE_CODIGO = '+IntToStr(pCodigo));
  qryGeral.Open;
  if qryGeral.IsEmpty then
  begin
    Result := True
  end
  else
  begin
    Result := False;
    raise Exception.Create('Cliente usado na venda. ');
  end;
  qryGeral.Close;
end;

procedure TSM.DataModuleCreate(Sender: TObject);
begin
  if fdConexao.Connected = False then
    fdConexao.Connected := True;
  FCliente := TCliente.Create;
  FProduto := TProduto.Create;
  FVenda := TVenda.Create;
end;

function TSM.ExecutarComando: Boolean;
begin
  try
    cmdGeral.Execute();
    Result := True;
  except
    on E:Exception do
    begin
      Result := False;
      raise Exception.Create('Não foi possível executar o comando.'+#13#10+E.Message);
    end;
  end;
end;

function TSM.GetCliente(pValue: string): TFDJSONDataSets;
begin
  qryClientes.Close;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Add(
    'SELECT * FROM CLIENTES');
  if pValue <> '' then
    qryClientes.SQL.Add(
      'WHERE '+
      'CODIGO LIKE ''%'+pValue+'%'' OR '+
      'CPF LIKE ''%'+pValue+'%'' OR '+
      'DATA_NASCIMENTO LIKE ''%'+pValue+'%'' OR '+
      'EMAIL LIKE ''%'+pValue+'%'' OR '+
      'TELEFONE LIKE ''%'+pValue+'%'' OR '+
      'NOME LIKE ''%'+pValue+'%'' ');
  qryClientes.Open();

  //retorno
  qryClientes.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryClientes);
end;

function TSM.PesquisarClientes(pValue: string):TFDJSONDataSets;
begin
  qryClientes.Close;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Add(
    'SELECT * FROM CLIENTES');
  if pValue <> '' then
    qryClientes.SQL.Add(
      'WHERE '+
      'CODIGO LIKE ''%'+pValue+'%'' OR '+
      'CPF LIKE ''%'+pValue+'%'' OR '+
      'DATA_NASCIMENTO LIKE ''%'+pValue+'%'' OR '+
      'EMAIL LIKE ''%'+pValue+'%'' OR '+
      'TELEFONE LIKE ''%'+pValue+'%'' OR '+
      'NOME LIKE ''%'+pValue+'%'' ');
  qryClientes.Open();
  //retorno
  qryClientes.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryClientes);
end;

function TSM.PesquisarProdutos(pValue: string):TFDJSONDataSets;
begin
  qryProdutos.Close;
  qryProdutos.SQL.Clear;
  qryProdutos.SQL.Add(
    'SELECT * FROM PRODUTOS');
  if pValue <> '' then
    qryProdutos.SQL.Add(
      'WHERE '+
      'CODIGO LIKE ''%'+pValue+'%'' OR '+
      'NOME LIKE ''%'+pValue+'%'' OR '+
      'PRECO LIKE ''%'+pValue+'%'' ');
  qryProdutos.Open();
  //retorno
  qryProdutos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryProdutos);
end;

function TSM.PesquisarQuery(pValue: string): TFDJSONDataSets;
begin
  // pesquisa
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(pValue);
  qryGeral.Open;

  //retorno
  qryGeral.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryGeral);
end;

function TSM.PesquisarVendaCodigo(pValue:Integer):TFDJSONDataSets;
begin
  qryVendas.Close;
  qryVendas.SQL.Clear;
  qryVendas.SQL.Add(
    'SELECT V.*, C.NOME Cliente, C.CPF ' +
    'FROM VENDAS V '+
    'INNER JOIN CLIENTES C ON C.CODIGO = V.CLIENTE_CODIGO ' +
    'WHERE V.CODIGO = '+IntToStr(pValue)+' '+
    'ORDER BY V.CODIGO DESC ');
  qryVendas.Open();
  //retorno
  qryVendas.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryVendas);
end;

function TSM.PesquisarVendas(pValue:string;pDtInicial,pDtFinal:TDateTime):TFDJSONDataSets;
begin
  qryVendas.Close;
  qryVendas.SQL.Clear;
  qryVendas.SQL.Add(
    'SELECT V.*, C.NOME Cliente, C.CPF ' +
    'FROM VENDAS V '+
    'INNER JOIN CLIENTES C ON C.CODIGO = V.CLIENTE_CODIGO ' +
    'WHERE V.DATA_ABERTURA BETWEEN :pDtInicial AND :pDtFinal ');
  if pValue <> '' then
    qryVendas.SQL.Add(
      'AND '+
      'V.CODIGO LIKE ''%'+pValue+'%'' OR '+
      'V.VALOR LIKE ''%'+pValue+'%'' OR '+
      'C.CPF LIKE ''%'+pValue+'%'' OR '+
      'C.NOME LIKE ''%'+pValue+'%'' ');
  qryVendas.SQL.Add('ORDER BY V.CODIGO DESC ');
  qryVendas.ParamByName('pDtInicial').AsDate := pDtInicial;
  qryVendas.ParamByName('pDtFinal').AsDate := pDtFinal;
  qryVendas.Open();
  //retorno
  qryVendas.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryVendas);
end;

function TSM.PesquisarVendasItens(pVenda: Integer): TFDJSONDataSets;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(
      'SELECT I.*, P.NOME PRODUTO FROM VENDAS_ITENS I '+
      'INNER JOIN PRODUTOS P ON P.CODIGO = I.PRODUTOS_CODIGO '+
      'WHERE VENDAS_CODIGO = '+IntToStr(pVenda));
  qryGeral.Open();
  //retorno
  qryGeral.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryGeral);
end;

function TSM.ProdutoAtualizar: Boolean;
begin
  if ProdutoValidarNome then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'UPDATE PRODUTOS SET '+
      'NOME = :pNome, PRECO = :pPreco '+
      'WHERE CODIGO = :pCodigo ');
    cmdGeral.ParamByName('pNome').AsString := FProduto.Nome;
    cmdGeral.ParamByName('pPreco').AsFloat := FProduto.Preco;
    cmdGeral.ParamByName('pCodigo').AsInteger := FProduto.Codigo;
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ProdutoInserir: Boolean;
begin
  if ProdutoValidarNome then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'INSERT INTO PRODUTOS (NOME,PRECO) '+
      'VALUES (:pNome, :pPreco); ');
    cmdGeral.ParamByName('pNome').AsString := FProduto.Nome;
    cmdGeral.ParamByName('pPreco').AsFloat := FProduto.Preco;
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ProdutoRemover(pCodigo: Integer): Boolean;
begin
  if ProdutoValidarRemocao(pCodigo) then
  begin
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'DELETE FROM PRODUTOS WHERE CODIGO = '+IntToStr(pCodigo));
    Result := ExecutarComando;
  end
  else
    Result := False;
end;

function TSM.ProdutoSalvar(pJson: string): Boolean;
begin
  FProduto := TJSon.JsonToObject<TProduto>(pJson);
  if FProduto.Codigo = 0 then
    Result := ProdutoInserir
  else
    Result := ProdutoAtualizar;
end;

function TSM.ProdutoValidarNome: Boolean;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(
    'SELECT CODIGO FROM PRODUTOS WHERE '+
    'NOME = '+QuotedStr(FProduto.Nome));
  if FProduto.Codigo > 0 then
    qryGeral.SQL.Add('AND CODIGO <> '+IntToStr(FProduto.Codigo));
  qryGeral.Open;
  if qryGeral.IsEmpty then
    Result := True
  else
  begin
    Result := False;
    raise Exception.Create('Nome já cadastrado.');
  end;
  qryGeral.Close;
end;

function TSM.ProdutoValidarRemocao(pCodigo: Integer): Boolean;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add(
    'SELECT TOP 1 VENDAS_CODIGO FROM VENDAS_ITENS WHERE '+
    'PRODUTOS_CODIGO = '+IntToStr(pCodigo));
  qryGeral.Open;
  if qryGeral.IsEmpty then
    Result := True
  else
  begin
    Result := False;
    raise Exception.Create('Produto utilizado em Vendas.');
  end;
  qryGeral.Close;
end;

function TSM.RetornaUltimoCodigo(pTabela: string): Integer;
begin
  qryGeral.Close;
  qryGeral.SQL.Clear;
  qryGeral.SQL.Add('SELECT IDENT_CURRENT( '''+pTabela+''' ) AS COD');
  qryGeral.Open;
  Result := qryGeral.FieldByName('COD').AsInteger;
  qryGeral.Close;
end;

function TSM.Test: string;
begin
  Result := 'test';
end;

function TSM.VendaAtualizar: Boolean;
begin
  cmdGeral.CommandText.Clear;
  cmdGeral.Params.Clear;
  cmdGeral.CommandText.Add(
    'UPDATE VENDAS SET '+
    'DATA_ABERTURA = :pData, '+
    'CLIENTE_CODIGO = :pCliente, '+
    'VALOR = :pValor '+
    'WHERE CODIGO = :pCodigo; ');
  cmdGeral.ParamByName('pData').AsDate := FVenda.Data;
  cmdGeral.ParamByName('pCliente').AsInteger := FVenda.ClienteCodigo;
  cmdGeral.ParamByName('pValor').AsCurrency := FVenda.Valor;
  cmdGeral.ParamByName('pCodigo').AsInteger := FVenda.Codigo;
  Result := ExecutarComando;
  VendaItemSalvar();
end;

function TSM.VendaInserir: Boolean;
begin
  cmdGeral.CommandText.Clear;
  cmdGeral.Params.Clear;
  cmdGeral.CommandText.Add(
    'INSERT INTO VENDAS (DATA_ABERTURA,CLIENTE_CODIGO,VALOR) '+
    'VALUES (:pData, :pCliente, :pValor); ');
  cmdGeral.ParamByName('pData').AsDate := FVenda.Data;
  cmdGeral.ParamByName('pCliente').AsInteger := FVenda.ClienteCodigo;
  cmdGeral.ParamByName('pValor').AsCurrency := FVenda.Valor;
  Result := ExecutarComando;
  FVenda.Codigo := RetornaUltimoCodigo('VENDAS');
  VendaItemSalvar();
end;

procedure TSM.VendaItemRemover(pVenda: Integer);
begin
  cmdGeral.CommandText.Clear;
  cmdGeral.Params.Clear;
  cmdGeral.CommandText.Add(
    'DELETE FROM VENDAS_ITENS WHERE VENDAS_CODIGO = '+IntToStr(pVenda));
  ExecutarComando;
end;

procedure TSM.VendaItemSalvar();
var
  i:Integer;
begin
  VendaItemRemover(FVenda.Codigo);
  for i := 0 to (FVenda.Itens.Count-1 ) do
  begin
///    FVendaItem := FVenda.Itens[i];
    cmdGeral.CommandText.Clear;
    cmdGeral.Params.Clear;
    cmdGeral.CommandText.Add(
      'INSERT INTO VENDAS_ITENS (VENDAS_CODIGO,ITEM,QUANTIDADE,PRECO,PRODUTOS_CODIGO) '+
      'VALUES (:pCodigo,:pItem,:pQuantidade,:pPreco,:pProduto); ');
    cmdGeral.ParamByName('pCodigo').AsInteger := FVenda.Codigo;
    cmdGeral.ParamByName('pItem').AsInteger := FVenda.Itens[i].Item;
    cmdGeral.ParamByName('pQuantidade').AsFloat := FVenda.Itens[i].Quantidade;
    cmdGeral.ParamByName('pPreco').AsFloat := FVenda.Itens[i].Preco;
    cmdGeral.ParamByName('pProduto').AsInteger := FVenda.Itens[i].ProdutoCodigo;
    ExecutarComando;
  end;
end;

function TSM.VendaRemover(pCodigo: Integer): Boolean;
begin
  cmdGeral.CommandText.Clear;
  cmdGeral.Params.Clear;
  cmdGeral.CommandText.Add(
    'DELETE FROM VENDAS WHERE CODIGO = '+IntToStr(pCodigo));
  Result := ExecutarComando;
end;

function TSM.VendaSalvar(pJson: string): Boolean;
begin
  FVenda := TJson.JsonToObject<TVenda>(pJson);
  if FVenda.Codigo = 0 then
    Result := VendaInserir
  else
    Result := VendaAtualizar;
end;

function TSM.PesquisarClienteCodigo(pValue: Integer):TFDJSONDataSets;
begin
  qryClientes.Close;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Add(
    'SELECT * FROM CLIENTES '+
    'WHERE CODIGO = '+IntToStr(pValue));
  qryClientes.Open();
  //retorno
  qryClientes.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryClientes);
end;

function TSM.PesquisarProdutoCodigo(pValue: Integer):TFDJSONDataSets;
begin
  qryProdutos.Close;
  qryProdutos.SQL.Clear;
  qryProdutos.SQL.Add(
    'SELECT * FROM PRODUTOS '+
    'WHERE CODIGO = '+IntToStr(pValue));
  qryProdutos.Open();
  //retorno
  qryProdutos.Active := False;
  Result := TFDJSONDataSets.Create;
  TFDJSONDataSetsWriter.ListAdd(Result,qryProdutos);
end;

end.





