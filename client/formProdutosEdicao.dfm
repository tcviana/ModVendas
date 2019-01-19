inherited frmProdutosEdicao: TfrmProdutosEdicao
  Caption = 'Produtos'
  ClientHeight = 183
  ClientWidth = 292
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 300
  ExplicitHeight = 210
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 292
    Height = 101
    ExplicitWidth = 292
    ExplicitHeight = 101
    object Label5: TLabel
      Left = 31
      Top = 9
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo:'
    end
    object Label6: TLabel
      Left = 37
      Top = 36
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome:'
    end
    object Label7: TLabel
      Left = 41
      Top = 63
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o'
    end
    object edtCodigo: TEdit
      Left = 78
      Top = 6
      Width = 200
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object edtNome: TEdit
      Left = 78
      Top = 33
      Width = 200
      Height = 21
      TabOrder = 1
    end
    object edtPreco: TEdit
      Left = 78
      Top = 60
      Width = 200
      Height = 21
      TabOrder = 2
      OnExit = edtPrecoExit
    end
  end
  inherited Panel1: TPanel
    Width = 292
    Caption = 'Produto'
    ExplicitWidth = 292
  end
  inherited Panel3: TPanel
    Top = 142
    Width = 292
    ExplicitTop = 142
    ExplicitWidth = 292
    inherited btnSair: TButton
      Left = 215
      ExplicitLeft = 215
    end
  end
  inherited ActionList1: TActionList
    Left = 16
    inherited actSalvarInserir: TAction
      OnExecute = actSalvarInserirExecute
    end
    inherited actSalvarSair: TAction
      OnExecute = actSalvarSairExecute
    end
  end
end
