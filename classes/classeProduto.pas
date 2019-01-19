unit classeProduto;

interface

uses SysUtils, Dialogs, Controls;

type
  TProduto = class

  protected
    FCodigo:Integer;
    FNome:string;
    FPreco:Extended;

  private
    function getNome: string;
    function getPreco: Extended;
    procedure setNome(const Value: string);
    procedure setPreco(const Value: Extended);
    function fncValidarNome(pNome:string):Boolean;
    function getCodigo: Integer;
    procedure setCodigo(const Value: Integer);

  public
    property Codigo:Integer read getCodigo write setCodigo;
    property Nome:string read getNome write setNome;
    property Preco:Extended read getPreco write setPreco;
end;

var
  uProduto:TProduto;

implementation

{ TProduto }

function TProduto.fncValidarNome(pNome: string): Boolean;
begin
  Result := True;
end;

function TProduto.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TProduto.getNome: string;
begin
  Result := FNome;
end;

function TProduto.getPreco: Extended;
begin
  Result := FPreco;
end;

procedure TProduto.setCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProduto.setNome(const Value: string);
begin
  if (Trim(Value) <> '') and fncValidarNome(Value) then
    FNome := Value
  else
    raise Exception.Create('Nome inválido.');
end;

procedure TProduto.setPreco(const Value: Extended);
begin
  FPreco := Value;
end;

end.
