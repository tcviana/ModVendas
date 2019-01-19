object frmModelo: TfrmModelo
  Left = 0
  Top = 0
  Caption = 'frmModelo'
  ClientHeight = 411
  ClientWidth = 782
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      782
      41)
    object lblNome: TLabel
      Left = 8
      Top = 6
      Width = 117
      Height = 23
      Caption = 'Nome da Tela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Button3: TButton
      Left = 699
      Top = 10
      Width = 75
      Height = 25
      Action = actPesquisar
      Anchors = [akTop, akRight]
      TabOrder = 0
    end
    object edtPesquisar: TButtonedEdit
      Left = 516
      Top = 11
      Width = 177
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      TabOrder = 1
      OnKeyUp = edtPesquisarKeyUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 782
    Height = 329
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 782
      Height = 329
      Align = alClient
      DataSource = dsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      OnTitleClick = DBGrid1TitleClick
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 370
    Width = 782
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      782
      41)
    object btnNovo: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Action = actNovo
      TabOrder = 0
    end
    object btnEditar: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 25
      Action = actEditar
      TabOrder = 1
    end
    object btnRemover: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Action = actRemover
      TabOrder = 2
    end
    object btnSair: TButton
      Left = 699
      Top = 6
      Width = 75
      Height = 25
      Action = actSair
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
  end
  object ActionList1: TActionList
    Left = 64
    Top = 248
    object actNovo: TAction
      Caption = '&Novo'
    end
    object actEditar: TAction
      Caption = '&Editar'
      OnExecute = actEditarExecute
    end
    object actRemover: TAction
      Caption = '&Remover'
    end
    object actSair: TAction
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = actSairExecute
    end
    object actPesquisar: TAction
      Caption = 'Pesquisar'
      OnExecute = actPesquisarExecute
    end
  end
  object dsPesquisa: TDataSource
    DataSet = memPesquisa
    Left = 72
    Top = 192
  end
  object memPesquisa: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 161
  end
end
