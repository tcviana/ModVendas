object frmModeloEdicao: TfrmModeloEdicao
  Left = 0
  Top = 0
  Caption = 'frmModeloEdicao'
  ClientHeight = 296
  ClientWidth = 625
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
  object Panel2: TPanel
    Left = 0
    Top = 41
    Width = 625
    Height = 214
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Edi'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel3: TPanel
    Left = 0
    Top = 255
    Width = 625
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      625
      41)
    object btnSalvarInserir: TButton
      Left = 8
      Top = 6
      Width = 99
      Height = 25
      Action = actSalvarInserir
      TabOrder = 0
    end
    object btnSalvarSair: TButton
      Left = 113
      Top = 6
      Width = 96
      Height = 25
      Action = actSalvarSair
      TabOrder = 1
    end
    object btnSair: TButton
      Left = 544
      Top = 6
      Width = 75
      Height = 25
      Action = actSair
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Left = 8
    Top = 8
    object actSalvarInserir: TAction
      Caption = 'Salvar e I&nserir'
      ShortCut = 16462
    end
    object actSalvarSair: TAction
      Caption = '&Salvar e Sair'
      ShortCut = 16467
    end
    object actSair: TAction
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = actSairExecute
    end
  end
end
