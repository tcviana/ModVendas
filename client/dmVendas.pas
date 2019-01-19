unit dmVendas;

interface

uses
  System.SysUtils, System.Classes, classeProxy, Datasnap.DSClientRest,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Dialogs,
  FireDAC.Stan.StorageBin, Datasnap.Provider, Datasnap.DBClient,
  Datasnap.DSConnect, FireDAC.DApt, Data.FireDACJSONReflect, classeCliente,
  classeVenda, classeProduto;

type
  TdmConexao = class(TDataModule)
    conServer: TDSRestConnection;
    qryClientes: TFDMemTable;
    qryProdutos: TFDMemTable;
    qryVendas: TFDMemTable;
    qryVendasItens: TFDMemTable;
    qryClientesCODIGO: TFDAutoIncField;
    qryClientesNOME: TStringField;
    qryClientesDATA_NASCIMENTO: TDateField;
    qryClientesCPF: TStringField;
    qryClientesEMAIL: TStringField;
    qryClientesTELEFONE: TStringField;
    qryProdutosCODIGO: TFDAutoIncField;
    qryProdutosNOME: TStringField;
    qryProdutosPRECO: TBCDField;
    qryVendasCODIGO: TFDAutoIncField;
    qryVendasDATA_ABERTURA: TDateField;
    qryVendasCLIENTE_CODIGO: TIntegerField;
    qryVendasCliente: TStringField;
    qryVendasCPF: TStringField;
    qryVendasVALOR: TBCDField;
    qryVendasItensCODIGO: TFDAutoIncField;
    qryVendasItensITEM: TIntegerField;
    qryVendasItensQUANTIDADE: TIntegerField;
    qryVendasItensVENDAS_CODIGO: TIntegerField;
    qryVendasItensPRODUTOS_CODIGO: TIntegerField;
    qryVendasItensPRECO: TBCDField;
    qryVendasItensProduto: TStringField;
    FDStanStorageBinLink1: TFDStanStorageBinLink;
    qryGeral: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TSMClient;
    function GetServerMethods1Client: TSMClient;
    procedure PopularCliente(pJson:TFDJSONDataSets);
    procedure PopularProduto(pJson:TFDJSONDataSets);
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property SM: TSMClient read GetServerMethods1Client write FServerMethods1Client;
    function PesquisarQuery(pScript: string;pShowMessage:Boolean):Boolean;overload;
    function PesquisarQuery(pScript: string):TFDJSONDataSets;overload;
    function PesquisarClientes(pFiltro:string):TFDJSONDataSets;
    function PesquisarProdutos(pFiltro:string):TFDJSONDataSets;
    function ClienteSalvar(pCliente: TCliente): Boolean;
    function PesquisarClienteCodigo(pId:Integer):Boolean;
    function PesquisarProdutoCodigo(pId:Integer):Boolean;
    function PesquisarVendasItens(pVenda:Integer):TFDJSONDataSets;
    function VendaSalvar(pVenda:TVenda):Boolean;
    function PesquisarVendas(pFiltro:string;pDataInicial,pDataFinal:TDateTime):TFDJSONDataSets;
    function ProdutoSalvar(pProduto:TProduto):Boolean;

end;

var
  dmConexao: TdmConexao;

implementation

uses
  REST.Json;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmConexao.ClienteSalvar(pCliente: TCliente): Boolean;
begin
  Result := SM.ClienteSalvar(TJson.ObjectToJsonString(pCliente));
end;

constructor TdmConexao.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  try
    conServer.TestConnection;
  except
    ShowMessage('Verifique a conexão com o servidor.');
  end;
end;

destructor TdmConexao.Destroy;
begin
  FServerMethods1Client.Free;
  inherited;
end;

function TdmConexao.GetServerMethods1Client: TSMClient;
begin
  if FServerMethods1Client = nil then
    FServerMethods1Client:= TSMClient.Create(conServer, FInstanceOwner);
  Result := FServerMethods1Client;
end;

function TdmConexao.PesquisarClienteCodigo(pId: Integer): Boolean;
var
  qryJson:TFDJSONDataSets;
begin
  qryJson := SM.PesquisarClienteCodigo(pId);
  PopularCliente(qryJson);
  Result := not qryClientes.IsEmpty;
end;

function TdmConexao.PesquisarClientes(pFiltro: string):TFDJSONDataSets;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := SM.PesquisarClientes(pFiltro);
  PopularCliente(qryJson);
  Result := qryJson;
end;

function TdmConexao.PesquisarProdutoCodigo(pId: Integer): Boolean;
var
  qryJson:TFDJSONDataSets;
begin
  qryJson := SM.PesquisarProdutoCodigo(pId);
  PopularProduto(qryJson);
  Result := not qryProdutos.IsEmpty;
end;

function TdmConexao.PesquisarProdutos(pFiltro: string): TFDJSONDataSets;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := SM.PesquisarProdutos(pFiltro);
  PopularProduto(qryJson);
  Result := qryJson;
end;

function TdmConexao.PesquisarQuery(pScript: string): TFDJSONDataSets;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := SM.PesquisarQuery(pScript);
  qryGeral.Active := False;
  qryGeral.AppendData(TFDJSONDataSetsReader.GetListValue(qryJson,0));
  qryGeral.Active := True;
  Result := qryJson;
end;

function TdmConexao.PesquisarVendas(pFiltro: string; pDataInicial,
  pDataFinal: TDateTime): TFDJSONDataSets;
begin
  Result := SM.PesquisarVendas(pFiltro,pDataInicial,pDataFinal);
end;

function TdmConexao.PesquisarVendasItens(pVenda: Integer): TFDJSONDataSets;
begin
  Result := SM.PesquisarVendasItens(pVenda);
end;

procedure TdmConexao.PopularCliente(pJson:TFDJSONDataSets);
begin
  qryClientes.Active := False;
  qryClientes.AppendData(TFDJSONDataSetsReader.GetListValue(pJson,0));
  qryClientes.Active := True;
end;

procedure TdmConexao.PopularProduto(pJson: TFDJSONDataSets);
begin
  qryProdutos.Active := False;
  qryProdutos.AppendData(TFDJSONDataSetsReader.GetListValue(pJson,0));
  qryProdutos.Active := True;
end;

function TdmConexao.ProdutoSalvar(pProduto: TProduto): Boolean;
begin
  Result := SM.ProdutoSalvar(TJson.ObjectToJsonString(pProduto));
end;

function TdmConexao.VendaSalvar(pVenda: TVenda): Boolean;
begin
  Result := SM.VendaSalvar(TJson.ObjectToJsonString(pVenda));
end;

function TdmConexao.PesquisarQuery(pScript: string;
  pShowMessage: Boolean): Boolean;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := SM.PesquisarQuery(pScript);
  qryGeral.Active := False;
  qryGeral.AppendData(TFDJSONDataSetsReader.GetListValue(qryJson,0));
  qryGeral.Active := True;

  Result := not qryGeral.IsEmpty;
  if not Result and pShowMessage then
    ShowMessage('Nenhum registro encontrado.');
end;

end.
