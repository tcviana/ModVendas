object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object dsServer: TDSServer
    Left = 96
    Top = 11
  end
  object dsDispatcher: TDSHTTPWebDispatcher
    Server = dsServer
    Filters = <>
    WebDispatch.PathInfo = 'datasnap*'
    Left = 96
    Top = 75
  end
  object dsClass: TDSServerClass
    OnGetClass = dsClassGetClass
    Server = dsServer
    Left = 200
    Top = 11
  end
end
