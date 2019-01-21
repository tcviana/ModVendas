inherited frmVendasItens: TfrmVendasItens
  Caption = 'Vendas'
  ClientHeight = 445
  ClientWidth = 467
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  ExplicitTop = -55
  ExplicitWidth = 475
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 467
    Height = 363
    ExplicitWidth = 467
    ExplicitHeight = 363
    object Panel4: TPanel
      Left = 0
      Top = 0
      Width = 467
      Height = 161
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label5: TLabel
        Left = 31
        Top = 9
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'digo:'
      end
      object Label8: TLabel
        Left = 150
        Top = 9
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data:'
      end
      object Label7: TLabel
        Left = 10
        Top = 36
        Width = 23
        Height = 13
        Alignment = taRightJustify
        Caption = 'CPF:'
      end
      object Label6: TLabel
        Left = 149
        Top = 36
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nome:'
      end
      object Label1: TLabel
        Left = 279
        Top = 9
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente:'
      end
      object edtCodigo: TEdit
        Left = 78
        Top = 6
        Width = 66
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
      end
      object edtData: TDateTimePicker
        Left = 183
        Top = 6
        Width = 90
        Height = 21
        Date = 43303.555453796290000000
        Time = 43303.555453796290000000
        TabOrder = 1
      end
      object edtNome: TEdit
        Left = 183
        Top = 33
        Width = 275
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
      end
      object edtCPF: TEdit
        Left = 39
        Top = 33
        Width = 104
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
      end
      object edtCliente: TButtonedEdit
        Left = 322
        Top = 6
        Width = 136
        Height = 21
        Images = ImageList1
        LeftButton.HotImageIndex = 0
        LeftButton.ImageIndex = 0
        LeftButton.PressedImageIndex = 0
        NumbersOnly = True
        RightButton.HotImageIndex = 0
        RightButton.ImageIndex = 0
        RightButton.PressedImageIndex = 0
        RightButton.Visible = True
        TabOrder = 2
        OnExit = edtClienteExit
        OnRightButtonClick = edtClienteRightButtonClick
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 76
        Width = 467
        Height = 85
        Align = alBottom
        Caption = 'Itens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        object Label2: TLabel
          Left = 7
          Top = 21
          Width = 42
          Height = 13
          Alignment = taRightJustify
          Caption = 'Produto:'
        end
        object Label3: TLabel
          Left = 227
          Top = 21
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Quantidade:'
        end
        object Label4: TLabel
          Left = 362
          Top = 21
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pre'#231'o:'
        end
        object Label10: TLabel
          Left = 176
          Top = 96
          Width = 34
          Height = 13
          Caption = 'PRECO'
          FocusControl = edtItemPreco
        end
        object Label11: TLabel
          Left = 176
          Top = 136
          Width = 38
          Height = 13
          Caption = 'Produto'
          FocusControl = edtItemProdutoNome
        end
        object edtItemProduto: TButtonedEdit
          Left = 50
          Top = 18
          Width = 60
          Height = 21
          Images = ImageList1
          LeftButton.HotImageIndex = 0
          LeftButton.ImageIndex = 0
          LeftButton.PressedImageIndex = 0
          NumbersOnly = True
          RightButton.HotImageIndex = 0
          RightButton.ImageIndex = 0
          RightButton.PressedImageIndex = 0
          RightButton.Visible = True
          TabOrder = 0
          OnExit = edtItemProdutoExit
          OnRightButtonClick = edtItemProdutoRightButtonClick
        end
        object btnInserir: TButton
          Left = 56
          Top = 52
          Width = 70
          Height = 25
          Action = actItemInserir
          TabOrder = 4
        end
        object btnEditar: TButton
          Left = 129
          Top = 52
          Width = 70
          Height = 25
          Action = actItemEditar
          TabOrder = 5
        end
        object btnSalvar: TButton
          Left = 202
          Top = 52
          Width = 70
          Height = 25
          Action = actItemSalvar
          TabOrder = 6
        end
        object btnCancelar: TButton
          Left = 275
          Top = 52
          Width = 70
          Height = 25
          Action = actItemCancelar
          TabOrder = 7
        end
        object btnExcluir: TButton
          Left = 348
          Top = 52
          Width = 70
          Height = 25
          Action = actItemExcluir
          TabOrder = 8
        end
        object edtItemQuantidade: TDBEdit
          Left = 293
          Top = 18
          Width = 64
          Height = 21
          DataField = 'QUANTIDADE'
          DataSource = dsItens
          TabOrder = 2
        end
        object edtItemPreco: TDBEdit
          Left = 398
          Top = 18
          Width = 59
          Height = 21
          DataField = 'PRECO'
          DataSource = dsItens
          TabOrder = 3
        end
        object edtItemProdutoNome: TDBEdit
          Left = 116
          Top = 18
          Width = 105
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'Produto'
          DataSource = dsItens
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object Grid: TDBGrid
      Left = 0
      Top = 161
      Width = 467
      Height = 167
      Align = alClient
      DataSource = dsItens
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ITEM'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Caption = 'Item'
          Width = 38
          Visible = True
        end
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'PRODUTOS_CODIGO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Produto'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Produto'
          ReadOnly = True
          Title.Caption = 'Descri'#231#227'o'
          Width = 143
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Title.Alignment = taRightJustify
          Title.Caption = 'Pre'#231'o'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_TOTAL'
          Title.Alignment = taRightJustify
          Title.Caption = 'Total'
          Width = 68
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 0
      Top = 328
      Width = 467
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object lblValorTotal: TLabel
        Left = 360
        Top = 6
        Width = 98
        Height = 19
        Alignment = taRightJustify
        Caption = 'Valor Total: 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  inherited Panel1: TPanel
    Width = 467
    Caption = 'Venda'
    ExplicitWidth = 467
  end
  inherited Panel3: TPanel
    Top = 404
    Width = 467
    ExplicitTop = 404
    ExplicitWidth = 467
    inherited btnSair: TButton
      Left = 390
      Caption = 'Cancelar'
      ExplicitLeft = 390
    end
  end
  inherited ActionList1: TActionList
    inherited actSalvarInserir: TAction
      Category = 'Venda'
      OnExecute = actSalvarInserirExecute
    end
    inherited actSalvarSair: TAction
      Category = 'Venda'
      OnExecute = actSalvarSairExecute
    end
    inherited actSair: TAction
      Category = 'Venda'
    end
    object actItemInserir: TAction
      Category = 'Itens'
      Caption = 'Inserir'
      OnExecute = actItemInserirExecute
      OnUpdate = actItemInserirUpdate
    end
    object actItemSalvar: TAction
      Category = 'Itens'
      Caption = 'Salvar'
      OnExecute = actItemSalvarExecute
      OnUpdate = actItemSalvarUpdate
    end
    object actItemCancelar: TAction
      Category = 'Itens'
      Caption = 'Cancelar'
      OnExecute = actItemCancelarExecute
      OnUpdate = actItemCancelarUpdate
    end
    object actItemExcluir: TAction
      Category = 'Itens'
      Caption = 'Excluir'
      OnExecute = actItemExcluirExecute
      OnUpdate = actItemExcluirUpdate
    end
    object actItemEditar: TAction
      Category = 'Itens'
      Caption = 'Editar'
      OnExecute = actItemEditarExecute
      OnUpdate = actItemEditarUpdate
    end
    object actItemSalvarIncluir: TAction
      Category = 'Itens'
      Caption = 'Salvar/Incluir'
      OnExecute = actItemSalvarIncluirExecute
      OnUpdate = actItemSalvarUpdate
    end
  end
  object ImageList1: TImageList
    Left = 56
    Top = 9
    Bitmap = {
      494C010101004800480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F7F7F708FBFBFB04000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F0F0F00F272625FB676665DCFDFDFD020000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F00F2C2A29FB747170FF282726FBFEFEFE010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F00F2C2B
      2AFC807F7EFF2B2A2AFBFCFCFC03000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0F0F00F292827FB8D8C
      8BFF31302FFBFCFCFC0300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FEFE
      FE01F6F6F609F4F4F40BFCFCFC0300000000F2F2F20D292826FB979696FF3332
      31FBFCFCFC030000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000DDDDDD228A8A
      8ADFC8C8C8FFD2D2D3FBB6B6B6FFA3A3A3649797976E878685FF333131FBFCFC
      FC03000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BBBBBB47D9D9D9E9F3F3
      EB3FF8F8F034F9F8F034F7F6EF36DAD9D38BB4B4B4FFA9A9A95BFCFCFC030000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F0F00FCBCACBF8F6F5EB4CF7F6
      EC47F7F6EC46F7F6EC46F7F6EC46F7F6EC46D6D6CC83A2A2A26D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009F9F9F7EE6E5D876F5F4E863F4F3
      E75CF5F4E75CF5F4E75CF5F4E75CF5F4E75CF3F2E55CCCCCCDFFFDFDFD020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A8A8A8CDEEEDDE81F3F2E47EF3F1
      E37BF3F1E171F3F1E171F3F1E171F3F1E171F2F1E171C7C7C2E8F9F9F9060000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4BEEBE9D79AF1F0E097F2F0
      E198F0EEDB8EF0EFDC8CF0EEDC8BEFEFDB8AEFEEDB89C5C6C2F3FBFBFB040000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C5C5C53ECBC9B7C4F1F0DFB4F3F0
      E2BCF4F3E5C3F3F2E3C0F0EFDFB4EFEEDBABEAE8D2A7BEBEBFF2000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD02D0D0D1FFE9E7D5CBF5F4
      E8DAF8F7EFE6F9F8F1E9F7F6ECE1F4F4E5D5A1A099F1E7E7E718000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA05CDCECEFEA2A1
      94E9F6F6F0F2FCFCF7F5D1D0C6ED90908EFDC4C4C44300000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CECE
      CE34AFAFAFB4B6B6B6C6AEAEAE74FCFCFC030000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFF9000000000000FFF0000000000000
      FFE0000000000000FFC1000000000000FF83000000000000E107000000000000
      C00F000000000000801F000000000000003F000000000000001F000000000000
      001F000000000000001F000000000000003F000000000000003F000000000000
      807F000000000000E0FF00000000000000000000000000000000000000000000
      000000000000}
  end
  object dsItens: TDataSource
    DataSet = memItens
    OnStateChange = dsItensStateChange
    Left = 216
    Top = 265
  end
  object memItens: TFDMemTable
    BeforePost = memItensBeforePost
    AfterPost = memItensAfterPost
    AfterDelete = memItensAfterDelete
    OnCalcFields = memItensCalcFields
    OnNewRecord = memItensNewRecord
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 233
    object memItensCODIGO: TFDAutoIncField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object memItensITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      Required = True
    end
    object memItensQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
    end
    object memItensVENDAS_CODIGO: TIntegerField
      FieldName = 'VENDAS_CODIGO'
      Origin = 'VENDAS_CODIGO'
      Required = True
    end
    object memItensPRODUTOS_CODIGO: TIntegerField
      FieldName = 'PRODUTOS_CODIGO'
      Origin = 'PRODUTOS_CODIGO'
      Required = True
    end
    object memItensPRECO: TBCDField
      FieldName = 'PRECO'
      Origin = 'PRECO'
      Required = True
      currency = True
      Precision = 15
      Size = 2
    end
    object memItensProduto: TStringField
      FieldName = 'Produto'
      Origin = 'Produto'
      Required = True
      Size = 100
    end
    object memItensVALOR_TOTAL: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'VALOR_TOTAL'
      Calculated = True
    end
  end
end
