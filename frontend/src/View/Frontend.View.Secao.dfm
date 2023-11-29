object ViewSecao: TViewSecao
  Left = 0
  Top = 0
  ClientHeight = 297
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  ShowHint = True
  OnCreate = IWAppFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BtnRetornar: TIWButton
    AlignWithMargins = False
    Left = 419
    Top = 218
    Width = 120
    Height = 30
    Caption = 'Retornar'
    Color = clBtnFace
    FriendlyName = 'BtnRetornar'
    OnAsyncClick = BtnRetornarAsyncClick
  end
  object BtnExcluir: TIWButton
    AlignWithMargins = False
    Left = 419
    Top = 182
    Width = 120
    Height = 30
    Caption = 'Excluir'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
  end
  object BtnAlterar: TIWButton
    AlignWithMargins = False
    Left = 419
    Top = 134
    Width = 120
    Height = 30
    Caption = 'Alterar'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
  end
  object BtnCadastrar: TIWButton
    AlignWithMargins = False
    Left = 419
    Top = 86
    Width = 120
    Height = 30
    Caption = 'Cadastrar'
    Color = clBtnFace
    FriendlyName = 'BtnCadastrar'
  end
  object BtnListar: TIWButton
    AlignWithMargins = False
    Left = 419
    Top = 38
    Width = 120
    Height = 30
    Caption = 'Listar'
    Color = clBtnFace
    FriendlyName = 'BtnListar'
  end
end
