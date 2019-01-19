object SM: TSM
  OldCreateOrder = False
  Height = 363
  Width = 320
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=MODVENDAS'
      'User_Name=sa'
      'Password=teste123'
      'Server=ADM-PC\SQLEXPRESS'
      'OSAuthent=No'
      'DriverID=MSSQL')
    LoginPrompt = False
    Transaction = fdTransacao
    Left = 40
    Top = 24
  end
  object fdTransacao: TFDTransaction
    Connection = fdConexao
    Left = 40
    Top = 168
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 72
  end
  object FDGUIxErrorDialog1: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 40
    Top = 120
  end
  object qryClientes: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 224
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
  object qryProdutos: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 224
    Top = 96
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
  object qryVendas: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT V.*, C.NOME Cliente, C.CPF'
      'FROM VENDAS V'
      'INNER JOIN CLIENTES C ON V.CLIENTE_CODIGO = C.CODIGO')
    Left = 224
    Top = 152
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
      Precision = 15
      Size = 2
    end
  end
  object qryVendasItens: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      'SELECT I.*, P.NOME Produto '
      'FROM VENDAS_ITENS I'
      'INNER JOIN PRODUTOS P ON I.PRODUTOS_CODIGO = P.CODIGO')
    Left = 224
    Top = 208
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
  object qryGeral: TFDQuery
    Connection = fdConexao
    SQL.Strings = (
      '')
    Left = 40
    Top = 224
  end
  object FDPhysMSSQLDriverLink: TFDPhysMSSQLDriverLink
    Left = 136
    Top = 32
  end
  object FDStanStorageBinLink: TFDStanStorageBinLink
    Left = 136
    Top = 88
  end
  object cmdGeral: TFDCommand
    Connection = fdConexao
    Left = 40
    Top = 280
  end
end
