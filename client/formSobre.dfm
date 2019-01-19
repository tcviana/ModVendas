inherited frmSobre: TfrmSobre
  Caption = 'Sobre'
  ClientHeight = 179
  ClientWidth = 297
  ExplicitWidth = 313
  ExplicitHeight = 218
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 297
    Height = 97
    object Label1: TLabel
      Left = 4
      Top = 24
      Width = 287
      Height = 19
      Caption = 'Desenvolvido Por: Tiago Coutinho Viana'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Panel1: TPanel
    Width = 297
    Caption = 'M'#243'dulo de Vendas'
    ExplicitTop = -6
    ExplicitWidth = 297
  end
  inherited Panel3: TPanel
    Top = 138
    Width = 297
    inherited btnSair: TButton
      Left = 216
    end
  end
  inherited ActionList1: TActionList
    inherited actSalvarInserir: TAction
      Visible = False
    end
    inherited actSalvarSair: TAction
      Visible = False
    end
  end
end
