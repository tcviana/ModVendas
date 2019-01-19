unit formClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Data.FireDACJSONReflect,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formModelo, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.Actions, Vcl.ActnList,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, classeCliente;

type
  TfrmClientes = class(TfrmModelo)
    procedure actNovoExecute(Sender: TObject);
    procedure actEditarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actRemoverExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
  private
    { Private declarations }
    FCliente : TCliente;
    procedure AbrirEdicao(pEditar:Boolean);
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses dmVendas, formClientesEdicao;

procedure TfrmClientes.AbrirEdicao(pEditar:Boolean);
var
  iRec : Integer;
begin
  Self.Hide;
  frmClientesEdicao := TfrmClientesEdicao.Create(Self);
  try
    iRec := memPesquisa.RecNo;
    if pEditar then
    begin
      frmClientesEdicao.edtCodigo.Text := memPesquisa.FieldByName('CODIGO').AsString;
      frmClientesEdicao.edtCPF.Text := memPesquisa.FieldByName('CPF').AsString;
      frmClientesEdicao.edtNascimento.Date := memPesquisa.FieldByName('DATA_NASCIMENTO').AsDateTime;
      frmClientesEdicao.edtNome.Text := memPesquisa.FieldByName('NOME').AsString;
      frmClientesEdicao.edtEmail.Text := memPesquisa.FieldByName('EMAIL').AsString;
      frmClientesEdicao.edtTelefone.Text := memPesquisa.FieldByName('TELEFONE').AsString;
    end;
    frmClientesEdicao.ShowModal;
    actPesquisar.Execute;
    if not memPesquisa.IsEmpty then
    begin
      try
        memPesquisa.RecNo := iRec;
      except
        memPesquisa.First;
      end;
    end;
  finally
    frmClientesEdicao.Free;
    Self.Show;
  end;
end;

procedure TfrmClientes.actEditarExecute(Sender: TObject);
begin
  inherited;
  AbrirEdicao(True);
end;

procedure TfrmClientes.actNovoExecute(Sender: TObject);
begin
  inherited;
  AbrirEdicao(False);
end;

procedure TfrmClientes.actPesquisarExecute(Sender: TObject);
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := dmConexao.PesquisarClientes(edtPesquisar.Text);
  PopularMemoria(qryJson);
  inherited;
end;

procedure TfrmClientes.actRemoverExecute(Sender: TObject);
var
  iRec : Integer;
begin
  inherited;
  if MessageDlg('Confirma a exclusão do cliente?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
  begin
    if dmConexao.SM.ClienteRemover(memPesquisa.FieldByName('CODIGO').AsInteger) then
    begin
      iRec := memPesquisa.RecNo;
      actPesquisar.Execute;
      try
        memPesquisa.RecNo := iRec;
      except
        memPesquisa.Last;
      end;
    end;
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FCliente := TCliente.Create;
end;

procedure TfrmClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  FCliente.Free;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  actPesquisar.Execute;
end;

end.
