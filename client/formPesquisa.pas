unit formPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Vcl.Bind.Grid, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Grid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmPesquisa = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    ActionList1: TActionList;
    actOk: TAction;
    actCancelar: TAction;
    DBGrid1: TDBGrid;
    dsPesquisa: TDataSource;
    qryGeral: TFDMemTable;
    procedure actOkExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FCodigo: Integer;
    FNome: string;
    FScript: TStringList;
    procedure AbrirConexao;
    { Private declarations }
  public
    { Public declarations }
    property Codigo:Integer read FCodigo write FCodigo;
    property Nome:string read FNome write FNome;
    property Script:TStringList read FScript write FScript;
  end;

var
  frmPesquisa: TfrmPesquisa;

implementation

{$R *.dfm}

uses dmVendas, Data.FireDACJSONReflect;

procedure TfrmPesquisa.AbrirConexao;
var
  qryJson: TFDJSONDataSets;
begin
  qryJson := dmConexao.PesquisarQuery(FScript.Text);
  qryGeral.Active := False;
  qryGeral.AppendData(TFDJSONDataSetsReader.GetListValue(qryJson,0));
  qryGeral.Active := True;
end;

procedure TfrmPesquisa.actCancelarExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmPesquisa.actOkExecute(Sender: TObject);
begin
  FCodigo := qryGeral.FieldByName('CODIGO').AsInteger;
  FNome := qryGeral.FieldByName('NOME').AsString;
  ModalResult := mrOk;
end;

procedure TfrmPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  actOk.Execute;
end;

procedure TfrmPesquisa.FormCreate(Sender: TObject);
begin
  FScript := TStringList.Create;
end;

procedure TfrmPesquisa.FormDestroy(Sender: TObject);
begin
  FScript.Free;
end;

procedure TfrmPesquisa.FormShow(Sender: TObject);
begin
  AbrirConexao;
end;

end.
