inherited frmVendas: TfrmVendas
  Caption = 'Vendas'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitTop = -89
  ExplicitWidth = 790
  ExplicitHeight = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblNome: TLabel
      Width = 61
      Caption = 'Vendas'
      ExplicitWidth = 61
    end
    object lbl1: TLabel [1]
      Left = 387
      Top = 14
      Width = 21
      Height = 13
      Caption = 'At'#233':'
    end
    object lbl2: TLabel [2]
      Left = 232
      Top = 14
      Width = 42
      Height = 13
      Caption = 'Data de:'
    end
    inherited edtPesquisar: TButtonedEdit
      TabOrder = 3
    end
    object dtpInicial: TDateTimePicker
      Left = 280
      Top = 11
      Width = 101
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 43337.737128611110000000
      Time = 43337.737128611110000000
      MinDate = 36526.000000000000000000
      TabOrder = 1
    end
    object dtpFinal: TDateTimePicker
      Left = 409
      Top = 11
      Width = 101
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Date = 43337.737128611110000000
      Time = 43337.737128611110000000
      MinDate = 36526.000000000000000000
      TabOrder = 2
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Alignment = taRightJustify
          Title.Caption = '#'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_ABERTURA'
          Title.Caption = 'Data'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cliente'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor'
          Width = 71
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited btnSair: TButton
      TabOrder = 4
    end
    object Button1: TButton
      Left = 251
      Top = 6
      Width = 75
      Height = 25
      Action = actImprimir
      TabOrder = 3
    end
  end
  inherited ActionList1: TActionList
    inherited actNovo: TAction
      OnExecute = actNovoExecute
    end
    inherited actRemover: TAction
      OnExecute = actRemoverExecute
    end
    object actImprimir: TAction
      Caption = 'Imprimir'
      OnExecute = actImprimirExecute
    end
  end
  object frxRelatorioVendas: TfrxReport
    Version = '6.0.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 43334.929220000000000000
    ReportOptions.LastChange = 43337.751663969910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 152
    Top = 201
    Datasets = <
      item
        DataSet = frxDbVendas
        DataSetName = 'frxDbVendas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        AllowSplit = True
        object Memo2: TfrxMemoView
          Left = 222.992270000000000000
          Top = 7.559060000000000000
          Width = 215.433210000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Vendas')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 7.559060000000000000
          Top = 41.574830000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
        end
        object Memo4: TfrxMemoView
          Left = 109.606370000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
        end
        object Memo5: TfrxMemoView
          Left = 608.504330000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Valor')
        end
        object Memo6: TfrxMemoView
          Left = 483.779840000000000000
          Top = 41.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF')
        end
        object Line2: TfrxLineView
          Left = -3.779530000000000000
          Top = 64.252010000000000000
          Width = 721.890230000000000000
          Color = clGray
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 49.133890000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        object Memo8: TfrxMemoView
          Left = 529.134200000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total:')
          ParentFont = False
        end
        object SysMemo1: TfrxSysMemoView
          Left = 608.504330000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDbVendas."VALOR">,MasterData1)]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Width = 721.890230000000000000
          Color = clGray
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        DataSet = frxDbVendas
        DataSetName = 'frxDbVendas'
        RowCount = 0
        object frxDbVendasDATA_ABERTURA: TfrxMemoView
          IndexTag = 1
          Left = 7.559060000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_ABERTURA'
          DataSet = frxDbVendas
          DataSetName = 'frxDbVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDbVendas."DATA_ABERTURA"]')
        end
        object frxDbVendasCliente: TfrxMemoView
          IndexTag = 1
          Left = 109.606370000000000000
          Top = 3.779529999999990000
          Width = 366.614410000000000000
          Height = 18.897650000000000000
          DataField = 'Cliente'
          DataSet = frxDbVendas
          DataSetName = 'frxDbVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDbVendas."Cliente"]')
        end
        object frxDbVendasCPF: TfrxMemoView
          IndexTag = 1
          Left = 483.779840000000000000
          Top = 3.779529999999990000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'CPF'
          DataSet = frxDbVendas
          DataSetName = 'frxDbVendas'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDbVendas."CPF"]')
        end
        object frxDbVendasVALOR: TfrxMemoView
          IndexTag = 1
          Left = 608.504330000000000000
          Top = 3.779529999999990000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR'
          DataSet = frxDbVendas
          DataSetName = 'frxDbVendas'
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDbVendas."VALOR"]')
        end
      end
    end
  end
  object frxDbVendas: TfrxDBDataset
    UserName = 'frxDbVendas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODIGO=CODIGO'
      'DATA_ABERTURA=DATA_ABERTURA'
      'CLIENTE_CODIGO=CLIENTE_CODIGO'
      'Cliente=Cliente'
      'CPF=CPF'
      'VALOR=VALOR')
    DataSet = memPesquisa
    BCDToCurrency = False
    Left = 256
    Top = 200
  end
end
