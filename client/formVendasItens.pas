unit formVendasItens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formModeloEdicao, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, System.ImageList,
  Vcl.ImgList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, classeVenda, classeVendaItem, Vcl.Mask, Rest.JSON,
  Datasnap.DBClient;

type
  TfrmVendasItens = class(TfrmModeloEdicao)
    ImageList1: TImageList;
    Panel4: TPanel;
    Label5: TLabel;
    edtCodigo: TEdit;
    Label8: TLabel;
    edtData: TDateTimePicker;
    edtNome: TEdit;
    Label7: TLabel;
    edtCPF: TEdit;
    Label6: TLabel;
    Label1: TLabel;
    edtCliente: TButtonedEdit;
    Grid: TDBGrid;
    dsItens: TDataSource;
    memItens: TFDMemTable;
    memItensCODIGO: TFDAutoIncField;
    memItensITEM: TIntegerField;
    memItensQUANTIDADE: TIntegerField;
    memItensVENDAS_CODIGO: TIntegerField;
    memItensPRODUTOS_CODIGO: TIntegerField;
    memItensPRECO: TBCDField;
    memItensProduto: TStringField;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    edtItemProduto: TButtonedEdit;
    Label3: TLabel;
    Label4: TLabel;
    btnInserir: TButton;
    btnEditar: TButton;
    btnSalvar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    actItemInserir: TAction;
    actItemSalvar: TAction;
    actItemCancelar: TAction;
    actItemExcluir: TAction;
    actItemEditar: TAction;
    edtItemQuantidade: TDBEdit;
    Label10: TLabel;
    edtItemPreco: TDBEdit;
    Label11: TLabel;
    edtItemProdutoNome: TDBEdit;
    Panel5: TPanel;
    lblValorTotal: TLabel;
    actItemSalvarIncluir: TAction;
    memItensVALOR_TOTAL: TCurrencyField;
    procedure actSalvarInserirExecute(Sender: TObject);
    procedure actSalvarSairExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtClienteRightButtonClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtItemProdutoExit(Sender: TObject);
    procedure edtItemProdutoRightButtonClick(Sender: TObject);
    procedure actItemInserirExecute(Sender: TObject);
    procedure actItemSalvarExecute(Sender: TObject);
    procedure actItemCancelarExecute(Sender: TObject);
    procedure actItemExcluirExecute(Sender: TObject);
    procedure actItemEditarExecute(Sender: TObject);
    procedure actItemInserirUpdate(Sender: TObject);
    procedure actItemSalvarUpdate(Sender: TObject);
    procedure actItemCancelarUpdate(Sender: TObject);
    procedure actItemExcluirUpdate(Sender: TObject);
    procedure actItemEditarUpdate(Sender: TObject);
    procedure memItensBeforePost(DataSet: TDataSet);
    procedure memItensNewRecord(DataSet: TDataSet);
    procedure dsItensStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memItensAfterPost(DataSet: TDataSet);
    procedure memItensAfterDelete(DataSet: TDataSet);
    procedure actItemSalvarIncluirExecute(Sender: TObject);
    procedure memItensCalcFields(DataSet: TDataSet);
  protected
    FVenda : TVenda;
    FVendaItem : TVendaItem;
    FCodigo:Integer;
    FNome:string;
  private
    { Private declarations }
    function Salvar:Boolean;
    procedure LimparCampos;
    procedure AbrirPesquisa(pTabela:string);
    procedure PreencherVendaItens;
    procedure PreencherItemProduto();
    procedure CalcularValorTotal;
    procedure PreencherCliente();
    procedure PreencherObjetoCliente();
    procedure PopularTabela();
    procedure AdicionaItensNoPedido();
    procedure CriarVenda();
    function LocalizarProduto():Boolean;
    procedure PreencherObjetoVendaItens();
  public
    { Public declarations }
  end;

var
  frmVendasItens: TfrmVendasItens;
  dblTotal:Currency;

implementation

uses formPesquisa, dmVendas, Data.FireDACJSONReflect;

{$R *.dfm}

procedure TfrmVendasItens.AbrirPesquisa(pTabela: string);
begin
  frmPesquisa := TfrmPesquisa.Create(Self);
  try
    frmPesquisa.Script.Add('SELECT * FROM '+pTabela);
    frmPesquisa.ShowModal;
    if frmPesquisa.ModalResult = mrOk then
      FCodigo := frmPesquisa.Codigo
    else
      FCodigo := 0;
  finally
    frmPesquisa.Free;
  end;
end;

procedure TfrmVendasItens.actItemCancelarExecute(Sender: TObject);
begin
  inherited;
  memItens.Cancel;
end;

procedure TfrmVendasItens.actItemCancelarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := memItens.Active and (memItens.State in [dsEdit,dsInsert]);
end;

procedure TfrmVendasItens.actItemEditarExecute(Sender: TObject);
begin
  inherited;
  memItens.Edit;
  edtItemProduto.SetFocus;
end;

procedure TfrmVendasItens.actItemEditarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := memItens.Active and (memItens.State = dsBrowse)
    and not memItens.IsEmpty;
end;

procedure TfrmVendasItens.actItemExcluirExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg('Confirma a exclus�o do item?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
    memItens.Delete;
end;

procedure TfrmVendasItens.actItemExcluirUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := memItens.Active and (memItens.State = dsBrowse)
    and not memItens.IsEmpty;
end;

procedure TfrmVendasItens.actItemInserirExecute(Sender: TObject);
begin
  inherited;
  memItens.Append;
  edtItemProduto.SetFocus;
end;

procedure TfrmVendasItens.actItemInserirUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := memItens.Active and (memItens.State = dsBrowse);
end;

procedure TfrmVendasItens.actItemSalvarExecute(Sender: TObject);
begin
  inherited;
  memItens.Post;
end;

procedure TfrmVendasItens.actItemSalvarIncluirExecute(Sender: TObject);
begin
  inherited;
  actItemSalvar.Execute;
  actItemInserir.Execute;
end;

procedure TfrmVendasItens.actItemSalvarUpdate(Sender: TObject);
begin
  inherited;
  (Sender as TAction).Enabled := memItens.Active
    and (memItens.State in [dsEdit,dsInsert]);
end;

procedure TfrmVendasItens.actSalvarInserirExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    LimparCampos;
  edtData.SetFocus;
end;

procedure TfrmVendasItens.actSalvarSairExecute(Sender: TObject);
begin
  inherited;
  if Salvar then
    actSair.Execute;
end;


procedure TfrmVendasItens.CalcularValorTotal;
var
  iRec:Integer;
begin
  dblTotal := 0;
  if memItens.Active and not memItens.IsEmpty then
  begin
    iRec := memItens.RecNo;
    memItens.DisableControls;
    memItens.First;
    while not memItens.Eof do
    begin
      dblTotal := dblTotal + memItensVALOR_TOTAL.AsCurrency;
      memItens.Next;
    end;
    memItens.RecNo := iRec;
    memItens.EnableControls;
  end;
  lblValorTotal.Caption := 'Valor Total: '+CurrToStrF(dblTotal, ffCurrency, 2);

end;

procedure TfrmVendasItens.CriarVenda;
begin
  // cabe�alho do pedido
  FVenda.Codigo := StrToInt(edtCodigo.Text);
  FVenda.Data := edtData.Date;
  FVenda.Valor := dblTotal;
  FVenda.ClienteCodigo := StrToInt(edtCliente.Text);
  FVenda.ClienteCPF := edtCPF.Text;
  FVenda.ClienteNome := edtNome.Text;
  // itens da venda
  AdicionaItensNoPedido();
end;

procedure TfrmVendasItens.AdicionaItensNoPedido();
var
  Itens:TVendaItem;
begin
  if memItens.Active and not memItens.IsEmpty then
  begin
    memItens.DisableControls;
    memItens.First;
    while not memItens.Eof do
    begin
      Itens := TVendaItem.Create;
      Itens.VendaCodigo := FVenda.Codigo;
      Itens.ProdutoCodigo := memItensPRODUTOS_CODIGO.AsInteger;
      Itens.Quantidade := memItensQUANTIDADE.AsFloat;
      Itens.Preco := memItensPRECO.AsFloat;
      Itens.Item := memItensITEM.AsInteger;

      FVenda.AddItem(Itens);

      memItens.Next;
    end;
    memItens.EnableControls;
  end;
end;

procedure TfrmVendasItens.dsItensStateChange(Sender: TObject);
begin
  inherited;
  if memItens.Active and not memItens.IsEmpty and (memItens.State = dsBrowse) then
    edtItemProduto.Text := memItensPRODUTOS_CODIGO.AsString;
  if memItens.Active and (memItens.State in [dsEdit,dsInsert]) then
  begin
    edtItemProduto.ReadOnly := False;
    edtItemQuantidade.ReadOnly := False;
    edtItemPreco.ReadOnly := False;
  end
  else
  begin
    edtItemProduto.ReadOnly := True;
    edtItemQuantidade.ReadOnly := True;
    edtItemPreco.ReadOnly := False;
  end;
end;

procedure TfrmVendasItens.edtClienteExit(Sender: TObject);
begin
  inherited;
  if edtCliente.Text <> '' then
  begin
    FVenda.ClienteCodigo := StrToInt(edtCliente.Text);
    // pesquisa o cliente para seu preenchimento
    if not dmConexao.PesquisarClienteCodigo(FVenda.ClienteCodigo) then
    begin
      ShowMessage('Cliente n�o localizado.');
      edtClienteRightButtonClick(Sender);
      Exit;
    end;
    dmConexao.qryClientes.Active := False;
    dmConexao.qryClientes.Active := True;
    PreencherCliente(dmConexao.qryClientes);
  end;
  if btnInserir.Enabled then
    btnInserir.SetFocus;
end;

procedure TfrmVendasItens.edtClienteRightButtonClick(Sender: TObject);
begin
  inherited;
  AbrirPesquisa('CLIENTES');
  FVenda.ClienteCodigo := FCodigo;
  PreencherCliente(dmConexao.qryGeral);
end;

procedure TfrmVendasItens.edtItemProdutoExit(Sender: TObject);
begin
  inherited;
  if memItens.State in [dsEdit,dsInsert] then
  begin
    if (edtItemProduto.Text <> '') then
    begin
      FVendaItem.ProdutoCodigo := StrToInt(edtItemProduto.Text);
      if not LocalizarProduto() then
      begin
        ShowMessage('Produto n�o localizado.');
        edtItemProdutoRightButtonClick(Sender);
        Exit;
      end;
      PreencherItemProduto();
    end;
  end;
end;

procedure TfrmVendasItens.edtItemProdutoRightButtonClick(Sender: TObject);
begin
  inherited;
  if memItens.State in [dsEdit,dsInsert] then
  begin
    AbrirPesquisa('PRODUTOS');
    FVendaItem.ProdutoCodigo := FCodigo;
    LocalizarProduto();
    PreencherItemProduto();
  end;
end;

procedure TfrmVendasItens.FormCreate(Sender: TObject);
begin
  inherited;
  FVenda := TVenda.Create;
  FVendaItem := TVendaItem.Create;
  LimparCampos;
  memItens.Open;
end;

procedure TfrmVendasItens.FormDestroy(Sender: TObject);
begin
  inherited;
  FVenda.Free;
  FVendaItem.Free;
end;

procedure TfrmVendasItens.FormShow(Sender: TObject);
begin
  inherited;
  PreencherVendaItens;
  CalcularValorTotal;
end;

procedure TfrmVendasItens.LimparCampos;
begin
  edtCodigo.Text := '0';
  edtData.Date := Date;
  edtCPF.Clear;
  edtCliente.Clear;
  edtNome.Clear;
  memItens.Close;
  memItens.Open;
  edtItemProduto.Clear;
  CalcularValorTotal;
end;

function TfrmVendasItens.LocalizarProduto():Boolean;
begin
  Result := dmConexao.PesquisarProdutoCodigo(FVendaItem.ProdutoCodigo);
  PreencherObjetoVendaItens();
end;

procedure TfrmVendasItens.memItensAfterDelete(DataSet: TDataSet);
var
  iRec:Integer;
begin
  inherited;
  if not memItens.IsEmpty then
  begin
    iRec := memItens.RecNo;
    memItens.DisableControls;
    memItens.First;
    while not memItens.Eof do
    begin
      memItens.Edit;
      memItensITEM.AsInteger := memItens.RecNo;
      memItens.Post;
      memItens.Next;
    end;
    memItens.RecNo := iRec;
    memItens.EnableControls;
  end;
end;

procedure TfrmVendasItens.memItensAfterPost(DataSet: TDataSet);
begin
  inherited;
  CalcularValorTotal;
  btnInserir.Enabled := True;
  btnInserir.SetFocus;
end;

procedure TfrmVendasItens.memItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (edtItemProduto.Text = '') and (memItensPRODUTOS_CODIGO.AsString = '') then
  begin
    ShowMessage('Produto n�o informado.');
    Abort;
  end;

  FVendaItem.ProdutoCodigo := memItensPRODUTOS_CODIGO.AsInteger;
  FVendaItem.Preco := memItensPRECO.AsFloat;
  FVendaItem.Quantidade := memItensQUANTIDADE.AsFloat;
end;

procedure TfrmVendasItens.memItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  memItensVALOR_TOTAL.AsCurrency := memItensQUANTIDADE.AsFloat * memItensPRECO.AsCurrency;
end;

procedure TfrmVendasItens.memItensNewRecord(DataSet: TDataSet);
begin
  inherited;
  memItensITEM.AsInteger := memItens.RecordCount + 1;
  memItensQUANTIDADE.AsInteger := 1;
  memItensPRECO.AsCurrency := 0;
end;

procedure TfrmVendasItens.PopularTabela;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := dmConexao.PesquisarVendasItens(StrToInt(edtCodigo.Text));
  memItens.Active := False;
  memItens.AppendData(TFDJSONDataSetsReader.GetListValue(qryJson,0));
  memItens.Active := True;
end;

procedure TfrmVendasItens.PreencherCliente();
begin
  edtCliente.Text := FVenda.ClienteCodigo;
  edtCPF.Text := FVenda.ClienteCPF;
  edtNome.Text := FVenda.ClienteNome;
end;

procedure TfrmVendasItens.PreencherItemProduto();
begin
  memItensPRODUTOS_CODIGO.AsInteger := FVendaItem.ProdutoCodigo;
  edtItemProduto.Text := memItensPRODUTOS_CODIGO.AsString;
  memItensProduto.AsString := FVendaItem.ProdutoNome;
  memItensPRECO.AsFloat := FVendaItem.ProdutoPreco;
end;

procedure TfrmVendasItens.PreencherObjetoCliente();
begin
  if dmConexao.qryClientes.IsEmpty then
  begin
    FVenda.ClienteCodigo := 0;
    FVenda.ClienteCPF := '';
    FVenda.ClienteNome := '';
  end
  else
  begin
    FVenda.ClienteCodigo := dmConexao.qryClientes.FieldByName('CODIGO').AsInteger;
    FVenda.ClienteCPF := dmConexao.qryClientes.FieldByName('CPF').AsString;
    FVenda.ClienteNome := dmConexao.qryClientes.FieldByName('NOME').AsString;;
  end;
end;

procedure TfrmVendasItens.PreencherObjetoVendaItens;
begin
  if dmConexao.qryProdutos.IsEmpty then
  begin
    FVendaItem.ProdutoNome := '';
    FVendaItem.ProdutoPreco := 0;
  end
  else
  begin
    FVendaItem.ProdutoNome := dmConexao.qryProdutos.FieldByName('NOME').AsString;
    FVendaItem.ProdutoPreco := dmConexao.qryProdutos.FieldByName('PRECO').AsCurrency;
  end;
end;

procedure TfrmVendasItens.PreencherVendaItens;
begin
  if edtCodigo.Text <> '0' then
    PopularTabela();
end;

function TfrmVendasItens.Salvar: Boolean;
begin
  if (memItens.State in [dsEdit,dsInsert]) then
    memItens.Post;
  // cabe�alho da venda
  if (edtCliente.Text = '') then
  begin
    ShowMessage('Cliente n�o informado.');
    Result := False;
  end
  else
  begin
    CriarVenda();
    Result := dmConexao.VendaSalvar(FVenda);
  end;
end;

end.
