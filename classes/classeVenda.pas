unit classeVenda;

interface

uses SysUtils, Dialogs, classeCliente, Controls,
  classeVendaItem, System.Generics.Collections;

type
  TVenda = class
  protected
    FCodigo:Integer;
    FData:TDateTime;
    FValor:Extended;
    FClienteCodigo:Integer;
    FClienteNome:string;
    FClienteCPF:string;
    FItens:TList<TVendaItem>;

  private
    function getCodigo: Integer;
    function getData: TDateTime;
    function getValor: Extended;
    procedure setCodigo(const Value: Integer);
    procedure setData(const Value: TDateTime);
    procedure setValor(const Value: Extended);
    function getClienteCodigo: Integer;
    function getClienteCPF: string;
    function getClienteNome: string;
    function getCodigoCliente: Integer;
    procedure setClienteCodigo(const Value: Integer);
    procedure setClienteCPF(const Value: string);
    procedure setClienteNome(const Value: string);
    procedure setCodigoCliente(const Value: Integer);

  public
    property Codigo:Integer read getCodigo write setCodigo;
    property Data:TDateTime read getData write setData;
    property Valor:Extended read getValor write setValor;
    property ClienteCodigo:Integer read getClienteCodigo write setClienteCodigo;
    property ClienteNome:string read getClienteNome write setClienteNome;
    property ClienteCPF:string read getClienteCPF write setClienteCPF;
    property Itens:TList<TVendaItem> read FItens write FItens;
    constructor Create();
    procedure AddItem(pVendaItem:TVendaItem);

end;

implementation

uses classePessoa;

{ TVenda }

procedure TVenda.AddItem(pVendaItem: TVendaItem);
begin
  FItens.Add(pVendaItem);
end;

constructor TVenda.Create();
begin
  FItens := TList<TVendaItem>.Create;
end;

function TVenda.getClienteCodigo: Integer;
begin
  Result := FClienteCodigo;
end;

function TVenda.getClienteCPF: string;
begin
  Result := FClienteCPF;
end;

function TVenda.getClienteNome: string;
begin
  Result := FClienteNome;
end;

function TVenda.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TVenda.getCodigoCliente: Integer;
begin
  Result := FClienteCodigo;
end;

function TVenda.getData: TDateTime;
begin
  Result := FData;
end;

function TVenda.getValor: Extended;
begin
  Result := FValor;
end;

procedure TVenda.setClienteCodigo(const Value: Integer);
begin
  FClienteCodigo := Value;
end;

procedure TVenda.setClienteCPF(const Value: string);
begin
  FClienteCPF := Value;
end;

procedure TVenda.setClienteNome(const Value: string);
begin
  FClienteNome := Value;
end;

procedure TVenda.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TVenda.setCodigoCliente(const Value: Integer);
begin
  FClienteCodigo := Value;
end;

procedure TVenda.setData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TVenda.setValor(const Value: Extended);
begin
  FValor := Value;
end;

end.
