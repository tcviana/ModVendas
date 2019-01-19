object dmConexao: TdmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 336
  Width = 415
  object conServer: TDSRestConnection
    Port = 8080
    UserName = 'Tiago'
    Password = 'Viana'
    LoginPrompt = False
    Left = 48
    Top = 40
    UniqueId = '{6DF75E54-A792-437E-86B1-E9AFB0899ABD}'
  end
  object qryClientes: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 40
    object qryClientesCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryClientesDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
      Origin = 'DATA_NASCIMENTO'
    end
    object qryClientesCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 15
    end
    object qryClientesEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 80
    end
    object qryClientesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
    end
  end
  object qryProdutos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 88
    object qryProdutosCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryProdutosPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object qryVendas: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 144
    object qryVendasCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVendasDATA_ABERTURA: TDateField
      FieldName = 'DATA_ABERTURA'
      Origin = 'DATA_ABERTURA'
      Required = True
    end
    object qryVendasCLIENTE_CODIGO: TIntegerField
      FieldName = 'CLIENTE_CODIGO'
      Origin = 'CLIENTE_CODIGO'
      Required = True
    end
    object qryVendasCliente: TStringField
      FieldName = 'Cliente'
      Origin = 'Cliente'
      Required = True
      Size = 100
    end
    object qryVendasCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      Size = 15
    end
    object qryVendasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Required = True
      currency = True
      Precision = 15
      Size = 2
    end
  end
  object qryVendasItens: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 200
    object qryVendasItensCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryVendasItensITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      Required = True
    end
    object qryVendasItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object qryVendasItensVENDAS_CODIGO: TIntegerField
      FieldName = 'VENDAS_CODIGO'
      Origin = 'VENDAS_CODIGO'
      Required = True
    end
    object qryVendasItensPRODUTOS_CODIGO: TIntegerField
      FieldName = 'PRODUTOS_CODIGO'
      Origin = 'PRODUTOS_CODIGO'
      Required = True
    end
    object qryVendasItensPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryVendasItensProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      Required = True
      Size = 100
    end
  end
  object FDStanStorageBinLink1: TFDStanStorageBinLink
    Left = 296
    Top = 56
  end
  object qryGeral: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 152
    Top = 256
  end
end
