//
// Created by the DataSnap proxy generator.
// 17/01/2019 23:32:07
//

unit classeProxy;

interface

uses System.JSON, Datasnap.DSProxyRest, Datasnap.DSClientRest, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.FireDACJSONReflect, Data.DBXJSONReflect;

type

  IDSRestCachedTFDJSONDataSets = interface;

  TSMClient = class(TDSAdminRestClient)
  private
    FDataModuleCreateCommand: TDSRestCommand;
    FRetornaUltimoCodigoCommand: TDSRestCommand;
    FPesquisarQueryCommand: TDSRestCommand;
    FPesquisarQueryCommand_Cache: TDSRestCommand;
    FPesquisarClientesCommand: TDSRestCommand;
    FPesquisarClientesCommand_Cache: TDSRestCommand;
    FPesquisarClienteCodigoCommand: TDSRestCommand;
    FPesquisarClienteCodigoCommand_Cache: TDSRestCommand;
    FClienteSalvarCommand: TDSRestCommand;
    FClienteRemoverCommand: TDSRestCommand;
    FGetClienteCommand: TDSRestCommand;
    FGetClienteCommand_Cache: TDSRestCommand;
    FPesquisarProdutosCommand: TDSRestCommand;
    FPesquisarProdutosCommand_Cache: TDSRestCommand;
    FPesquisarProdutoCodigoCommand: TDSRestCommand;
    FPesquisarProdutoCodigoCommand_Cache: TDSRestCommand;
    FProdutoSalvarCommand: TDSRestCommand;
    FProdutoRemoverCommand: TDSRestCommand;
    FPesquisarVendasCommand: TDSRestCommand;
    FPesquisarVendasCommand_Cache: TDSRestCommand;
    FPesquisarVendaCodigoCommand: TDSRestCommand;
    FPesquisarVendaCodigoCommand_Cache: TDSRestCommand;
    FVendaSalvarCommand: TDSRestCommand;
    FVendaRemoverCommand: TDSRestCommand;
    FPesquisarVendasItensCommand: TDSRestCommand;
    FPesquisarVendasItensCommand_Cache: TDSRestCommand;
    FVendaItemSalvarCommand: TDSRestCommand;
    FVendaItemRemoverCommand: TDSRestCommand;
    FTestCommand: TDSRestCommand;
    FEchoStringCommand: TDSRestCommand;
    FReverseStringCommand: TDSRestCommand;
  public
    constructor Create(ARestConnection: TDSRestConnection); overload;
    constructor Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure DataModuleCreate(Sender: TObject);
    function RetornaUltimoCodigo(pTabela: string; const ARequestFilter: string = ''): Integer;
    function PesquisarQuery(pValue: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarQuery_Cache(pValue: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisarClientes(pValue: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarClientes_Cache(pValue: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisarClienteCodigo(pValue: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarClienteCodigo_Cache(pValue: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ClienteSalvar(pJson: string; const ARequestFilter: string = ''): Boolean;
    function ClienteRemover(pCodigo: Integer; const ARequestFilter: string = ''): Boolean;
    function GetCliente(pValue: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function GetCliente_Cache(pValue: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisarProdutos(pValue: string; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarProdutos_Cache(pValue: string; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisarProdutoCodigo(pValue: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarProdutoCodigo_Cache(pValue: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function ProdutoSalvar(pJson: string; const ARequestFilter: string = ''): Boolean;
    function ProdutoRemover(pCodigo: Integer; const ARequestFilter: string = ''): Boolean;
    function PesquisarVendas(pValue: string; pDtInicial: TDateTime; pDtFinal: TDateTime; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarVendas_Cache(pValue: string; pDtInicial: TDateTime; pDtFinal: TDateTime; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function PesquisarVendaCodigo(pValue: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarVendaCodigo_Cache(pValue: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function VendaSalvar(pJson: string; const ARequestFilter: string = ''): Boolean;
    function VendaRemover(pCodigo: Integer; const ARequestFilter: string = ''): Boolean;
    function PesquisarVendasItens(pVenda: Integer; const ARequestFilter: string = ''): TFDJSONDataSets;
    function PesquisarVendasItens_Cache(pVenda: Integer; const ARequestFilter: string = ''): IDSRestCachedTFDJSONDataSets;
    function VendaItemSalvar(pJson: string; const ARequestFilter: string = ''): Boolean;
    procedure VendaItemRemover(pVenda: Integer);
    function Test(const ARequestFilter: string = ''): string;
    function EchoString(Value: string; const ARequestFilter: string = ''): string;
    function ReverseString(Value: string; const ARequestFilter: string = ''): string;
  end;

  IDSRestCachedTFDJSONDataSets = interface(IDSRestCachedObject<TFDJSONDataSets>)
  end;

  TDSRestCachedTFDJSONDataSets = class(TDSRestCachedObject<TFDJSONDataSets>, IDSRestCachedTFDJSONDataSets, IDSRestCachedCommand)
  end;

const
  TSM_DataModuleCreate: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'Sender'; Direction: 1; DBXType: 37; TypeName: 'TObject')
  );

  TSM_RetornaUltimoCodigo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pTabela'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 6; TypeName: 'Integer')
  );

  TSM_PesquisarQuery: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarQuery_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_PesquisarClientes: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarClientes_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_PesquisarClienteCodigo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarClienteCodigo_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_ClienteSalvar: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_ClienteRemover: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pCodigo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_GetCliente: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_GetCliente_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_PesquisarProdutos: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarProdutos_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_PesquisarProdutoCodigo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarProdutoCodigo_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_ProdutoSalvar: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_ProdutoRemover: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pCodigo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_PesquisarVendas: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDtInicial'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'pDtFinal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarVendas_Cache: array [0..3] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: 'pDtInicial'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: 'pDtFinal'; Direction: 1; DBXType: 11; TypeName: 'TDateTime'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_PesquisarVendaCodigo: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarVendaCodigo_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pValue'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_VendaSalvar: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_VendaRemover: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pCodigo'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_PesquisarVendasItens: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pVenda'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 37; TypeName: 'TFDJSONDataSets')
  );

  TSM_PesquisarVendasItens_Cache: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pVenda'; Direction: 1; DBXType: 6; TypeName: 'Integer'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'String')
  );

  TSM_VendaItemSalvar: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'pJson'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 4; TypeName: 'Boolean')
  );

  TSM_VendaItemRemover: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: 'pVenda'; Direction: 1; DBXType: 6; TypeName: 'Integer')
  );

  TSM_Test: array [0..0] of TDSRestParameterMetaData =
  (
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_EchoString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

  TSM_ReverseString: array [0..1] of TDSRestParameterMetaData =
  (
    (Name: 'Value'; Direction: 1; DBXType: 26; TypeName: 'string'),
    (Name: ''; Direction: 4; DBXType: 26; TypeName: 'string')
  );

implementation

procedure TSMClient.DataModuleCreate(Sender: TObject);
begin
  if FDataModuleCreateCommand = nil then
  begin
    FDataModuleCreateCommand := FConnection.CreateCommand;
    FDataModuleCreateCommand.RequestType := 'POST';
    FDataModuleCreateCommand.Text := 'TSM."DataModuleCreate"';
    FDataModuleCreateCommand.Prepare(TSM_DataModuleCreate);
  end;
  if not Assigned(Sender) then
    FDataModuleCreateCommand.Parameters[0].Value.SetNull
  else
  begin
    FMarshal := TDSRestCommand(FDataModuleCreateCommand.Parameters[0].ConnectionHandler).GetJSONMarshaler;
    try
      FDataModuleCreateCommand.Parameters[0].Value.SetJSONValue(FMarshal.Marshal(Sender), True);
      if FInstanceOwner then
        Sender.Free
    finally
      FreeAndNil(FMarshal)
    end
    end;
  FDataModuleCreateCommand.Execute;
end;

function TSMClient.RetornaUltimoCodigo(pTabela: string; const ARequestFilter: string): Integer;
begin
  if FRetornaUltimoCodigoCommand = nil then
  begin
    FRetornaUltimoCodigoCommand := FConnection.CreateCommand;
    FRetornaUltimoCodigoCommand.RequestType := 'GET';
    FRetornaUltimoCodigoCommand.Text := 'TSM.RetornaUltimoCodigo';
    FRetornaUltimoCodigoCommand.Prepare(TSM_RetornaUltimoCodigo);
  end;
  FRetornaUltimoCodigoCommand.Parameters[0].Value.SetWideString(pTabela);
  FRetornaUltimoCodigoCommand.Execute(ARequestFilter);
  Result := FRetornaUltimoCodigoCommand.Parameters[1].Value.GetInt32;
end;

function TSMClient.PesquisarQuery(pValue: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarQueryCommand = nil then
  begin
    FPesquisarQueryCommand := FConnection.CreateCommand;
    FPesquisarQueryCommand.RequestType := 'GET';
    FPesquisarQueryCommand.Text := 'TSM.PesquisarQuery';
    FPesquisarQueryCommand.Prepare(TSM_PesquisarQuery);
  end;
  FPesquisarQueryCommand.Parameters[0].Value.SetWideString(pValue);
  FPesquisarQueryCommand.Execute(ARequestFilter);
  if not FPesquisarQueryCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarQueryCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarQueryCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarQueryCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarQuery_Cache(pValue: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarQueryCommand_Cache = nil then
  begin
    FPesquisarQueryCommand_Cache := FConnection.CreateCommand;
    FPesquisarQueryCommand_Cache.RequestType := 'GET';
    FPesquisarQueryCommand_Cache.Text := 'TSM.PesquisarQuery';
    FPesquisarQueryCommand_Cache.Prepare(TSM_PesquisarQuery_Cache);
  end;
  FPesquisarQueryCommand_Cache.Parameters[0].Value.SetWideString(pValue);
  FPesquisarQueryCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarQueryCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.PesquisarClientes(pValue: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarClientesCommand = nil then
  begin
    FPesquisarClientesCommand := FConnection.CreateCommand;
    FPesquisarClientesCommand.RequestType := 'GET';
    FPesquisarClientesCommand.Text := 'TSM.PesquisarClientes';
    FPesquisarClientesCommand.Prepare(TSM_PesquisarClientes);
  end;
  FPesquisarClientesCommand.Parameters[0].Value.SetWideString(pValue);
  FPesquisarClientesCommand.Execute(ARequestFilter);
  if not FPesquisarClientesCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarClientesCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarClientesCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarClientesCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarClientes_Cache(pValue: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarClientesCommand_Cache = nil then
  begin
    FPesquisarClientesCommand_Cache := FConnection.CreateCommand;
    FPesquisarClientesCommand_Cache.RequestType := 'GET';
    FPesquisarClientesCommand_Cache.Text := 'TSM.PesquisarClientes';
    FPesquisarClientesCommand_Cache.Prepare(TSM_PesquisarClientes_Cache);
  end;
  FPesquisarClientesCommand_Cache.Parameters[0].Value.SetWideString(pValue);
  FPesquisarClientesCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarClientesCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.PesquisarClienteCodigo(pValue: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarClienteCodigoCommand = nil then
  begin
    FPesquisarClienteCodigoCommand := FConnection.CreateCommand;
    FPesquisarClienteCodigoCommand.RequestType := 'GET';
    FPesquisarClienteCodigoCommand.Text := 'TSM.PesquisarClienteCodigo';
    FPesquisarClienteCodigoCommand.Prepare(TSM_PesquisarClienteCodigo);
  end;
  FPesquisarClienteCodigoCommand.Parameters[0].Value.SetInt32(pValue);
  FPesquisarClienteCodigoCommand.Execute(ARequestFilter);
  if not FPesquisarClienteCodigoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarClienteCodigoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarClienteCodigoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarClienteCodigoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarClienteCodigo_Cache(pValue: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarClienteCodigoCommand_Cache = nil then
  begin
    FPesquisarClienteCodigoCommand_Cache := FConnection.CreateCommand;
    FPesquisarClienteCodigoCommand_Cache.RequestType := 'GET';
    FPesquisarClienteCodigoCommand_Cache.Text := 'TSM.PesquisarClienteCodigo';
    FPesquisarClienteCodigoCommand_Cache.Prepare(TSM_PesquisarClienteCodigo_Cache);
  end;
  FPesquisarClienteCodigoCommand_Cache.Parameters[0].Value.SetInt32(pValue);
  FPesquisarClienteCodigoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarClienteCodigoCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.ClienteSalvar(pJson: string; const ARequestFilter: string): Boolean;
begin
  if FClienteSalvarCommand = nil then
  begin
    FClienteSalvarCommand := FConnection.CreateCommand;
    FClienteSalvarCommand.RequestType := 'GET';
    FClienteSalvarCommand.Text := 'TSM.ClienteSalvar';
    FClienteSalvarCommand.Prepare(TSM_ClienteSalvar);
  end;
  FClienteSalvarCommand.Parameters[0].Value.SetWideString(pJson);
  FClienteSalvarCommand.Execute(ARequestFilter);
  Result := FClienteSalvarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.ClienteRemover(pCodigo: Integer; const ARequestFilter: string): Boolean;
begin
  if FClienteRemoverCommand = nil then
  begin
    FClienteRemoverCommand := FConnection.CreateCommand;
    FClienteRemoverCommand.RequestType := 'GET';
    FClienteRemoverCommand.Text := 'TSM.ClienteRemover';
    FClienteRemoverCommand.Prepare(TSM_ClienteRemover);
  end;
  FClienteRemoverCommand.Parameters[0].Value.SetInt32(pCodigo);
  FClienteRemoverCommand.Execute(ARequestFilter);
  Result := FClienteRemoverCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.GetCliente(pValue: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FGetClienteCommand = nil then
  begin
    FGetClienteCommand := FConnection.CreateCommand;
    FGetClienteCommand.RequestType := 'GET';
    FGetClienteCommand.Text := 'TSM.GetCliente';
    FGetClienteCommand.Prepare(TSM_GetCliente);
  end;
  FGetClienteCommand.Parameters[0].Value.SetWideString(pValue);
  FGetClienteCommand.Execute(ARequestFilter);
  if not FGetClienteCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FGetClienteCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FGetClienteCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FGetClienteCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.GetCliente_Cache(pValue: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FGetClienteCommand_Cache = nil then
  begin
    FGetClienteCommand_Cache := FConnection.CreateCommand;
    FGetClienteCommand_Cache.RequestType := 'GET';
    FGetClienteCommand_Cache.Text := 'TSM.GetCliente';
    FGetClienteCommand_Cache.Prepare(TSM_GetCliente_Cache);
  end;
  FGetClienteCommand_Cache.Parameters[0].Value.SetWideString(pValue);
  FGetClienteCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FGetClienteCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.PesquisarProdutos(pValue: string; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarProdutosCommand = nil then
  begin
    FPesquisarProdutosCommand := FConnection.CreateCommand;
    FPesquisarProdutosCommand.RequestType := 'GET';
    FPesquisarProdutosCommand.Text := 'TSM.PesquisarProdutos';
    FPesquisarProdutosCommand.Prepare(TSM_PesquisarProdutos);
  end;
  FPesquisarProdutosCommand.Parameters[0].Value.SetWideString(pValue);
  FPesquisarProdutosCommand.Execute(ARequestFilter);
  if not FPesquisarProdutosCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarProdutosCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarProdutosCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarProdutosCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarProdutos_Cache(pValue: string; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarProdutosCommand_Cache = nil then
  begin
    FPesquisarProdutosCommand_Cache := FConnection.CreateCommand;
    FPesquisarProdutosCommand_Cache.RequestType := 'GET';
    FPesquisarProdutosCommand_Cache.Text := 'TSM.PesquisarProdutos';
    FPesquisarProdutosCommand_Cache.Prepare(TSM_PesquisarProdutos_Cache);
  end;
  FPesquisarProdutosCommand_Cache.Parameters[0].Value.SetWideString(pValue);
  FPesquisarProdutosCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarProdutosCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.PesquisarProdutoCodigo(pValue: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarProdutoCodigoCommand = nil then
  begin
    FPesquisarProdutoCodigoCommand := FConnection.CreateCommand;
    FPesquisarProdutoCodigoCommand.RequestType := 'GET';
    FPesquisarProdutoCodigoCommand.Text := 'TSM.PesquisarProdutoCodigo';
    FPesquisarProdutoCodigoCommand.Prepare(TSM_PesquisarProdutoCodigo);
  end;
  FPesquisarProdutoCodigoCommand.Parameters[0].Value.SetInt32(pValue);
  FPesquisarProdutoCodigoCommand.Execute(ARequestFilter);
  if not FPesquisarProdutoCodigoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarProdutoCodigoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarProdutoCodigoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarProdutoCodigoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarProdutoCodigo_Cache(pValue: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarProdutoCodigoCommand_Cache = nil then
  begin
    FPesquisarProdutoCodigoCommand_Cache := FConnection.CreateCommand;
    FPesquisarProdutoCodigoCommand_Cache.RequestType := 'GET';
    FPesquisarProdutoCodigoCommand_Cache.Text := 'TSM.PesquisarProdutoCodigo';
    FPesquisarProdutoCodigoCommand_Cache.Prepare(TSM_PesquisarProdutoCodigo_Cache);
  end;
  FPesquisarProdutoCodigoCommand_Cache.Parameters[0].Value.SetInt32(pValue);
  FPesquisarProdutoCodigoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarProdutoCodigoCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.ProdutoSalvar(pJson: string; const ARequestFilter: string): Boolean;
begin
  if FProdutoSalvarCommand = nil then
  begin
    FProdutoSalvarCommand := FConnection.CreateCommand;
    FProdutoSalvarCommand.RequestType := 'GET';
    FProdutoSalvarCommand.Text := 'TSM.ProdutoSalvar';
    FProdutoSalvarCommand.Prepare(TSM_ProdutoSalvar);
  end;
  FProdutoSalvarCommand.Parameters[0].Value.SetWideString(pJson);
  FProdutoSalvarCommand.Execute(ARequestFilter);
  Result := FProdutoSalvarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.ProdutoRemover(pCodigo: Integer; const ARequestFilter: string): Boolean;
begin
  if FProdutoRemoverCommand = nil then
  begin
    FProdutoRemoverCommand := FConnection.CreateCommand;
    FProdutoRemoverCommand.RequestType := 'GET';
    FProdutoRemoverCommand.Text := 'TSM.ProdutoRemover';
    FProdutoRemoverCommand.Prepare(TSM_ProdutoRemover);
  end;
  FProdutoRemoverCommand.Parameters[0].Value.SetInt32(pCodigo);
  FProdutoRemoverCommand.Execute(ARequestFilter);
  Result := FProdutoRemoverCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.PesquisarVendas(pValue: string; pDtInicial: TDateTime; pDtFinal: TDateTime; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarVendasCommand = nil then
  begin
    FPesquisarVendasCommand := FConnection.CreateCommand;
    FPesquisarVendasCommand.RequestType := 'GET';
    FPesquisarVendasCommand.Text := 'TSM.PesquisarVendas';
    FPesquisarVendasCommand.Prepare(TSM_PesquisarVendas);
  end;
  FPesquisarVendasCommand.Parameters[0].Value.SetWideString(pValue);
  FPesquisarVendasCommand.Parameters[1].Value.AsDateTime := pDtInicial;
  FPesquisarVendasCommand.Parameters[2].Value.AsDateTime := pDtFinal;
  FPesquisarVendasCommand.Execute(ARequestFilter);
  if not FPesquisarVendasCommand.Parameters[3].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarVendasCommand.Parameters[3].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarVendasCommand.Parameters[3].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarVendasCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarVendas_Cache(pValue: string; pDtInicial: TDateTime; pDtFinal: TDateTime; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarVendasCommand_Cache = nil then
  begin
    FPesquisarVendasCommand_Cache := FConnection.CreateCommand;
    FPesquisarVendasCommand_Cache.RequestType := 'GET';
    FPesquisarVendasCommand_Cache.Text := 'TSM.PesquisarVendas';
    FPesquisarVendasCommand_Cache.Prepare(TSM_PesquisarVendas_Cache);
  end;
  FPesquisarVendasCommand_Cache.Parameters[0].Value.SetWideString(pValue);
  FPesquisarVendasCommand_Cache.Parameters[1].Value.AsDateTime := pDtInicial;
  FPesquisarVendasCommand_Cache.Parameters[2].Value.AsDateTime := pDtFinal;
  FPesquisarVendasCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarVendasCommand_Cache.Parameters[3].Value.GetString);
end;

function TSMClient.PesquisarVendaCodigo(pValue: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarVendaCodigoCommand = nil then
  begin
    FPesquisarVendaCodigoCommand := FConnection.CreateCommand;
    FPesquisarVendaCodigoCommand.RequestType := 'GET';
    FPesquisarVendaCodigoCommand.Text := 'TSM.PesquisarVendaCodigo';
    FPesquisarVendaCodigoCommand.Prepare(TSM_PesquisarVendaCodigo);
  end;
  FPesquisarVendaCodigoCommand.Parameters[0].Value.SetInt32(pValue);
  FPesquisarVendaCodigoCommand.Execute(ARequestFilter);
  if not FPesquisarVendaCodigoCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarVendaCodigoCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarVendaCodigoCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarVendaCodigoCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarVendaCodigo_Cache(pValue: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarVendaCodigoCommand_Cache = nil then
  begin
    FPesquisarVendaCodigoCommand_Cache := FConnection.CreateCommand;
    FPesquisarVendaCodigoCommand_Cache.RequestType := 'GET';
    FPesquisarVendaCodigoCommand_Cache.Text := 'TSM.PesquisarVendaCodigo';
    FPesquisarVendaCodigoCommand_Cache.Prepare(TSM_PesquisarVendaCodigo_Cache);
  end;
  FPesquisarVendaCodigoCommand_Cache.Parameters[0].Value.SetInt32(pValue);
  FPesquisarVendaCodigoCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarVendaCodigoCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.VendaSalvar(pJson: string; const ARequestFilter: string): Boolean;
begin
  if FVendaSalvarCommand = nil then
  begin
    FVendaSalvarCommand := FConnection.CreateCommand;
    FVendaSalvarCommand.RequestType := 'GET';
    FVendaSalvarCommand.Text := 'TSM.VendaSalvar';
    FVendaSalvarCommand.Prepare(TSM_VendaSalvar);
  end;
  FVendaSalvarCommand.Parameters[0].Value.SetWideString(pJson);
  FVendaSalvarCommand.Execute(ARequestFilter);
  Result := FVendaSalvarCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.VendaRemover(pCodigo: Integer; const ARequestFilter: string): Boolean;
begin
  if FVendaRemoverCommand = nil then
  begin
    FVendaRemoverCommand := FConnection.CreateCommand;
    FVendaRemoverCommand.RequestType := 'GET';
    FVendaRemoverCommand.Text := 'TSM.VendaRemover';
    FVendaRemoverCommand.Prepare(TSM_VendaRemover);
  end;
  FVendaRemoverCommand.Parameters[0].Value.SetInt32(pCodigo);
  FVendaRemoverCommand.Execute(ARequestFilter);
  Result := FVendaRemoverCommand.Parameters[1].Value.GetBoolean;
end;

function TSMClient.PesquisarVendasItens(pVenda: Integer; const ARequestFilter: string): TFDJSONDataSets;
begin
  if FPesquisarVendasItensCommand = nil then
  begin
    FPesquisarVendasItensCommand := FConnection.CreateCommand;
    FPesquisarVendasItensCommand.RequestType := 'GET';
    FPesquisarVendasItensCommand.Text := 'TSM.PesquisarVendasItens';
    FPesquisarVendasItensCommand.Prepare(TSM_PesquisarVendasItens);
  end;
  FPesquisarVendasItensCommand.Parameters[0].Value.SetInt32(pVenda);
  FPesquisarVendasItensCommand.Execute(ARequestFilter);
  if not FPesquisarVendasItensCommand.Parameters[1].Value.IsNull then
  begin
    FUnMarshal := TDSRestCommand(FPesquisarVendasItensCommand.Parameters[1].ConnectionHandler).GetJSONUnMarshaler;
    try
      Result := TFDJSONDataSets(FUnMarshal.UnMarshal(FPesquisarVendasItensCommand.Parameters[1].Value.GetJSONValue(True)));
      if FInstanceOwner then
        FPesquisarVendasItensCommand.FreeOnExecute(Result);
    finally
      FreeAndNil(FUnMarshal)
    end
  end
  else
    Result := nil;
end;

function TSMClient.PesquisarVendasItens_Cache(pVenda: Integer; const ARequestFilter: string): IDSRestCachedTFDJSONDataSets;
begin
  if FPesquisarVendasItensCommand_Cache = nil then
  begin
    FPesquisarVendasItensCommand_Cache := FConnection.CreateCommand;
    FPesquisarVendasItensCommand_Cache.RequestType := 'GET';
    FPesquisarVendasItensCommand_Cache.Text := 'TSM.PesquisarVendasItens';
    FPesquisarVendasItensCommand_Cache.Prepare(TSM_PesquisarVendasItens_Cache);
  end;
  FPesquisarVendasItensCommand_Cache.Parameters[0].Value.SetInt32(pVenda);
  FPesquisarVendasItensCommand_Cache.ExecuteCache(ARequestFilter);
  Result := TDSRestCachedTFDJSONDataSets.Create(FPesquisarVendasItensCommand_Cache.Parameters[1].Value.GetString);
end;

function TSMClient.VendaItemSalvar(pJson: string; const ARequestFilter: string): Boolean;
begin
  if FVendaItemSalvarCommand = nil then
  begin
    FVendaItemSalvarCommand := FConnection.CreateCommand;
    FVendaItemSalvarCommand.RequestType := 'GET';
    FVendaItemSalvarCommand.Text := 'TSM.VendaItemSalvar';
    FVendaItemSalvarCommand.Prepare(TSM_VendaItemSalvar);
  end;
  FVendaItemSalvarCommand.Parameters[0].Value.SetWideString(pJson);
  FVendaItemSalvarCommand.Execute(ARequestFilter);
  Result := FVendaItemSalvarCommand.Parameters[1].Value.GetBoolean;
end;

procedure TSMClient.VendaItemRemover(pVenda: Integer);
begin
  if FVendaItemRemoverCommand = nil then
  begin
    FVendaItemRemoverCommand := FConnection.CreateCommand;
    FVendaItemRemoverCommand.RequestType := 'GET';
    FVendaItemRemoverCommand.Text := 'TSM.VendaItemRemover';
    FVendaItemRemoverCommand.Prepare(TSM_VendaItemRemover);
  end;
  FVendaItemRemoverCommand.Parameters[0].Value.SetInt32(pVenda);
  FVendaItemRemoverCommand.Execute;
end;

function TSMClient.Test(const ARequestFilter: string): string;
begin
  if FTestCommand = nil then
  begin
    FTestCommand := FConnection.CreateCommand;
    FTestCommand.RequestType := 'GET';
    FTestCommand.Text := 'TSM.Test';
    FTestCommand.Prepare(TSM_Test);
  end;
  FTestCommand.Execute(ARequestFilter);
  Result := FTestCommand.Parameters[0].Value.GetWideString;
end;

function TSMClient.EchoString(Value: string; const ARequestFilter: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FConnection.CreateCommand;
    FEchoStringCommand.RequestType := 'GET';
    FEchoStringCommand.Text := 'TSM.EchoString';
    FEchoStringCommand.Prepare(TSM_EchoString);
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.Execute(ARequestFilter);
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TSMClient.ReverseString(Value: string; const ARequestFilter: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FConnection.CreateCommand;
    FReverseStringCommand.RequestType := 'GET';
    FReverseStringCommand.Text := 'TSM.ReverseString';
    FReverseStringCommand.Prepare(TSM_ReverseString);
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.Execute(ARequestFilter);
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection);
begin
  inherited Create(ARestConnection);
end;

constructor TSMClient.Create(ARestConnection: TDSRestConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ARestConnection, AInstanceOwner);
end;

destructor TSMClient.Destroy;
begin
  FDataModuleCreateCommand.DisposeOf;
  FRetornaUltimoCodigoCommand.DisposeOf;
  FPesquisarQueryCommand.DisposeOf;
  FPesquisarQueryCommand_Cache.DisposeOf;
  FPesquisarClientesCommand.DisposeOf;
  FPesquisarClientesCommand_Cache.DisposeOf;
  FPesquisarClienteCodigoCommand.DisposeOf;
  FPesquisarClienteCodigoCommand_Cache.DisposeOf;
  FClienteSalvarCommand.DisposeOf;
  FClienteRemoverCommand.DisposeOf;
  FGetClienteCommand.DisposeOf;
  FGetClienteCommand_Cache.DisposeOf;
  FPesquisarProdutosCommand.DisposeOf;
  FPesquisarProdutosCommand_Cache.DisposeOf;
  FPesquisarProdutoCodigoCommand.DisposeOf;
  FPesquisarProdutoCodigoCommand_Cache.DisposeOf;
  FProdutoSalvarCommand.DisposeOf;
  FProdutoRemoverCommand.DisposeOf;
  FPesquisarVendasCommand.DisposeOf;
  FPesquisarVendasCommand_Cache.DisposeOf;
  FPesquisarVendaCodigoCommand.DisposeOf;
  FPesquisarVendaCodigoCommand_Cache.DisposeOf;
  FVendaSalvarCommand.DisposeOf;
  FVendaRemoverCommand.DisposeOf;
  FPesquisarVendasItensCommand.DisposeOf;
  FPesquisarVendasItensCommand_Cache.DisposeOf;
  FVendaItemSalvarCommand.DisposeOf;
  FVendaItemRemoverCommand.DisposeOf;
  FTestCommand.DisposeOf;
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  inherited;
end;

end.

