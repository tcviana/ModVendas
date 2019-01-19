program ModVendasServer;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uMain in 'uMain.pas' {Form1},
  ServerMethods in 'ServerMethods.pas' {SM: TDataModule},
  WebModule in 'WebModule.pas' {WebModule1: TWebModule},
  classeCliente in '..\classes\classeCliente.pas',
  classePessoa in '..\classes\classePessoa.pas',
  classeProduto in '..\classes\classeProduto.pas',
  classeVenda in '..\classes\classeVenda.pas',
  classeVendaItem in '..\classes\classeVendaItem.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
