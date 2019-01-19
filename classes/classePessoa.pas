unit classePessoa;

interface

uses SysUtils;

type
  TPessoa = class

  protected
    FCodigo:Integer;
    FNome:string;
    FTelefone:string;
    FEmail:string;
  private
    function getCodigo: Integer;
    function getEmail: string;
    function getNome: string;
    function getTelefone: string;
    procedure setCodigo(const Value: Integer);
    procedure setEmail(const Value: string);
    procedure setNome(const Value: string);
    procedure setTelefone(const Value: string);

  public
    property Codigo:Integer read getCodigo write setCodigo;
    property Nome:string read getNome write setNome;
    property Telefone:string read getTelefone write setTelefone;
    property Email:string read getEmail write setEmail;
end;

implementation

{ TPessoa }

function TPessoa.getCodigo: Integer;
begin
  Result := FCodigo;
end;

function TPessoa.getEmail: string;
begin
  Result := FEmail;
end;

function TPessoa.getNome: string;
begin
  Result := FNome;
end;

function TPessoa.getTelefone: string;
begin
  Result := FTelefone;
end;

procedure TPessoa.setCodigo(const Value: Integer);
begin
  if Value > -1 then
    FCodigo := Value
  else
    raise Exception.Create('Código inválido.');
end;

procedure TPessoa.setEmail(const Value: string);
begin
  if (Value = '') or ((Pos('@',Value)>0) and (Pos('.',Value)>0)) then
    FEmail := Trim(Value)
  else
    raise Exception.Create('E-mail inválido.');
end;

procedure TPessoa.setNome(const Value: string);
begin
  if Trim(Value) <> '' then
    FNome := Trim(Value)
  else
    raise Exception.Create('Nome inválido.');
end;

procedure TPessoa.setTelefone(const Value: string);
begin
  FTelefone := Trim(Value);
end;

end.
