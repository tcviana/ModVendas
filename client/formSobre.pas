unit formSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formModeloEdicao, Vcl.StdCtrls,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TfrmSobre = class(TfrmModeloEdicao)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.dfm}

end.
