inherited frmClientesEdicao: TfrmClientesEdicao
  Caption = 'Clientes'
  ClientHeight = 258
  ClientWidth = 292
  OnCreate = FormCreate
  ExplicitWidth = 308
  ExplicitHeight = 297
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    Width = 292
    Height = 176
    ExplicitWidth = 292
    ExplicitHeight = 176
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
      Left = 45
      Top = 63
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'CPF:'
    end
    object Label8: TLabel
      Left = 13
      Top = 146
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nascimento:'
    end
    object Label1: TLabel
      Left = 22
      Top = 119
      Width = 46
      Height = 13
      Alignment = taRightJustify
      Caption = 'Telefone:'
    end
    object Label2: TLabel
      Left = 36
      Top = 92
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'E-mail:'
    end
    object edtCPF: TEdit
      Left = 78
      Top = 60
      Width = 200
      Height = 21
      NumbersOnly = True
      TabOrder = 2
    end
    object edtNome: TEdit
      Left = 78
      Top = 33
      Width = 200
      Height = 21
      TabOrder = 1
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
    object edtNascimento: TDateTimePicker
      Left = 78
      Top = 143
      Width = 200
      Height = 21
      Date = 43303.555453796290000000
      Time = 43303.555453796290000000
      TabOrder = 5
    end
    object edtTelefone: TEdit
      Left = 78
      Top = 116
      Width = 200
      Height = 21
      NumbersOnly = True
      TabOrder = 4
    end
    object edtEmail: TEdit
      Left = 78
      Top = 89
      Width = 200
      Height = 21
      TabOrder = 3
    end
  end
  inherited Panel1: TPanel
    Width = 292
    Caption = 'Cliente'
    ExplicitWidth = 292
  end
  inherited Panel3: TPanel
    Top = 217
    Width = 292
    ExplicitTop = 217
    ExplicitWidth = 292
    DesignSize = (
      292
      41)
    inherited btnSalvarSair: TButton
      Default = True
    end
    inherited btnSair: TButton
      Left = 215
      ExplicitLeft = 215
    end
  end
  inherited ActionList1: TActionList
    inherited actSalvarInserir: TAction
      OnExecute = actSalvarInserirExecute
    end
    inherited actSalvarSair: TAction
      OnExecute = actSalvarSairExecute
    end
  end
end
