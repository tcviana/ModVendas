unit formClientesEdicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formModeloEdicao, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls, classeCliente,
  Vcl.ComCtrls, Vcl.ActnMan, Vcl.ActnColorMaps, Rest.JSon,  Data.DBXJSON, Data.DBXJSONReflect;

type
  TfrmClientesEdicao = class(TfrmModeloEdicao)
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtCPF: TEdit;
    edtNome: TEdit;
    edtCodigo: TEdit;
    edtNascimento: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure actSalvarSairExecute(Sender: TObject);
    procedure actSalvarInserirExecute(Sender: TObject);
  private
    { Private declarations }
    FCliente : TCliente;
    function Salvar:Boolean;
    procedure LimparCampos;
  public
    { Public declarations }
  end;

var
  frmClientesEdicao: TfrmClientesEdicao;

implementation

{$R *.dfm}

uses dmVendas;

procedure TfrmClientesEdicao.actSalvarInserirExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    LimparCampos;
  edtNome.SetFocus;
end;

procedure TfrmClientesEdicao.actSalvarSairExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    actSair.Execute;
end;

procedure TfrmClientesEdicao.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TCliente.Create;
  LimparCampos;
end;

procedure TfrmClientesEdicao.LimparCampos;
begin
  edtCodigo.Text := '0';
  edtNome.Clear;
  edtCPF.Clear;
  edtNascimento.Date := Date;
  edtEmail.Clear;
  edtTelefone.Clear;
end;

function TfrmClientesEdicao.Salvar: Boolean;
begin
  FCliente.Codigo := StrToInt(edtCodigo.Text);
  FCliente.Nome := edtNome.Text;
  FCliente.CPF := edtCPF.Text;
  FCliente.DataNascimento := edtNascimento.Date;
  FCliente.Email := edtEmail.Text;
  FCliente.Telefone := edtTelefone.Text;
  Result := dmConexao.ClienteSalvar(FCliente);
end;

end.
