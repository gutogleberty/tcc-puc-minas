object ViewAplicacao: TViewAplicacao
  Left = 0
  Top = 0
  Caption = 'Backend - PUC Minas'
  ClientHeight = 104
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 398
    Height = 104
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 4
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 38
      Width = 224
      Height = 25
      Alignment = taCenter
      Caption = 'Servidor de Aplica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu1
    OnDblClick = TrayIcon1DblClick
    Left = 40
    Top = 24
  end
  object PopupMenu1: TPopupMenu
    Left = 136
    Top = 24
    object Restaurar1: TMenuItem
      Caption = 'Restaurar'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object fechar1: TMenuItem
      Caption = 'Sair'
      OnClick = fechar1Click
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnMinimize = ApplicationEvents1Minimize
    Left = 320
    Top = 32
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 208
    Top = 32
  end
end
