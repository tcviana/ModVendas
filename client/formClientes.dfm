inherited frmClientes: TfrmClientes
  Caption = 'Clientes'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited lblNome: TLabel
      Width = 64
      Caption = 'Clientes'
      ExplicitWidth = 64
    end
    inherited Button3: TButton
      Left = 698
      ExplicitLeft = 698
    end
    inherited edtPesquisar: TButtonedEdit
      Left = 510
      ExplicitLeft = 510
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
          Width = 31
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Caption = 'Nome'
          Width = 244
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF'
          Width = 111
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL'
          Title.Caption = 'E-mail'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TELEFONE'
          Title.Caption = 'Telefone'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_NASCIMENTO'
          Title.Caption = 'Data de Nascimento'
          Width = 113
          Visible = True
        end>
    end
  end
  inherited ActionList1: TActionList
    inherited actNovo: TAction
      OnExecute = actNovoExecute
    end
    inherited actRemover: TAction
      OnExecute = actRemoverExecute
    end
  end
end
