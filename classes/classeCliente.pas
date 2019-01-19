unit classeCliente;

interface

uses
  SysUtils, classePessoa, Dialogs, Controls;

type
  TCliente = class(TPessoa)
  protected
    FCPF : string;
    FDataNascimento : TDateTime;
  private
    function getCPF: string;
    function getDataNascimento: TDateTime;
    procedure setCPF(const Value: string);
    procedure setDataNascimento(const Value: TDateTime);

  public
    property DataNascimento:TDateTime read getDataNascimento write setDataNascimento;
    property CPF:string read getCPF write setCPF;

end;

var
  uCliente:TCliente;

implementation

{ TCliente }

function TCliente.getCPF: string;
begin
  Result := FCPF;
end;

function TCliente.getDataNascimento: TDateTime;
begin
  Result := FDataNascimento;
end;

procedure TCliente.setCPF(const Value: string);
begin
  if (Length(Value) > 10) then
    FCPF := Value
  else
    raise Exception.Create('CPF inválido.');
end;

procedure TCliente.setDataNascimento(const Value: TDateTime);
begin
  FDataNascimento := Value;
end;


end.
