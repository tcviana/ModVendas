unit classeVendaItem;

interface

uses SysUtils, classeProduto;

type
  TVendaItem = class
  protected
    FCodigo: Integer;
    FItem: Integer;
    FProdutoCodigo: Integer;
    FProdutoNome: string;
    FProdutoPreco: Extended;
    FQuantidade: Extended;
    FVendaCodigo: Integer;
    FPreco: Extended;
    FProduto: TProduto;
  private
    function getCodigo: Integer;
    function getItem: Integer;
    function getProdutoCodigo: Integer;
    function getProdutoNome: string;
    function getProdutoPreco: Extended;
    function getQuantidade: Extended;
    function getVendaCodigo: Integer;
    procedure setCodigo(const Value: Integer);
    procedure setItem(const Value: Integer);
    procedure setProdutoCodigo(const Value: Integer);
    procedure setProdutoNome(const Value: string);
    procedure setProdutoPreco(const Value: Extended);
    procedure setQuantidade(const Value: Extended);
    procedure setVendaCodigo(const Value: Integer);
    function getPreco: Extended;
    procedure setPreco(const Value: Extended);
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo:Integer read getCodigo write setCodigo;
    property VendaCodigo:Integer read getVendaCodigo write setVendaCodigo;
    property ProdutoCodigo:Integer read getProdutoCodigo write setProdutoCodigo;
    property ProdutoNome:string read getProdutoNome write setProdutoNome;
    property ProdutoPreco:Extended read getProdutoPreco write setProdutoPreco;
    property Quantidade:Extended read getQuantidade write setQuantidade;
    property Item:Integer read getItem write setItem;
    property Preco:Extended read getPreco write setPreco;
end;

implementation

{ TVendaItem }

constructor TVendaItem.Create;
begin
  FProduto := TProduto.Create;
end;

destructor TVendaItem.Destroy;
begin
  FProduto.Free;
end;

function TVendaItem.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TVendaItem.getItem: Integer;
begin
  Result := FItem;
end;

function TVendaItem.getPreco: Extended;
begin
  Result := FPreco;
end;

function TVendaItem.getProdutoCodigo: Integer;
begin
  Result := FProdutoCodigo;
end;

function TVendaItem.getProdutoNome: string;
begin
  Result := FProdutoNome;
end;

function TVendaItem.getProdutoPreco: Extended;
begin
  Result := FProdutoPreco;
end;

function TVendaItem.getQuantidade: Extended;
begin
  Result := FQuantidade;
end;

function TVendaItem.getVendaCodigo: Integer;
begin
  Result := FVendaCodigo;
end;

procedure TVendaItem.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TVendaItem.setItem(const Value: Integer);
begin
  FItem := Value;
end;

procedure TVendaItem.setPreco(const Value: Extended);
begin
  FPreco := Value;
end;

procedure TVendaItem.setProdutoCodigo(const Value: Integer);
begin
  FProdutoCodigo := Value;
end;

procedure TVendaItem.setProdutoNome(const Value: string);
begin
  FProdutoNome := Value;
end;

procedure TVendaItem.setProdutoPreco(const Value: Extended);
begin
  FProdutoPreco := Value;
end;

procedure TVendaItem.setQuantidade(const Value: Extended);
begin
  if Value > 0 then  
    FQuantidade := Value
  else
    raise Exception.Create('Quantidade não informada.');
end;

procedure TVendaItem.setVendaCodigo(const Value: Integer);
begin
  FVendaCodigo := Value;
end;

end.
