object frmPrincipal: TfrmPrincipal
  Left = 2
  Top = 55
  Caption = 'Vendas'
  ClientHeight = 289
  ClientWidth = 263
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 195
    Height = 29
    Caption = 'M'#243'dulo de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 56
    Top = 51
    Width = 150
    Height = 40
    Action = actClientes
    Caption = 'Clientes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Button2: TButton
    Left = 56
    Top = 143
    Width = 150
    Height = 40
    Action = actVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button3: TButton
    Left = 56
    Top = 97
    Width = 150
    Height = 40
    Action = actProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object Button4: TButton
    Left = 56
    Top = 237
    Width = 150
    Height = 40
    Action = actSair
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button5: TButton
    Left = 56
    Top = 189
    Width = 150
    Height = 40
    Action = actSobre
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object ActionList1: TActionList
    Left = 8
    Top = 64
    object actClientes: TAction
      Caption = 'Pessoas'
      OnExecute = actClientesExecute
    end
    object actProdutos: TAction
      Caption = 'Produtos'
      OnExecute = actProdutosExecute
    end
    object actVendas: TAction
      Caption = 'Vendas'
      OnExecute = actVendasExecute
    end
    object actSair: TAction
      Caption = 'Sair'
      OnExecute = actSairExecute
    end
    object actSobre: TAction
      Caption = 'Sobre'
      OnExecute = actSobreExecute
    end
  end
end
