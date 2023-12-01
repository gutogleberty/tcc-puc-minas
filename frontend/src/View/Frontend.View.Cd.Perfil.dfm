inherited ViewCdPerfil: TViewCdPerfil
  OnShow = IWAppFormShow
  DesignLeft = 2
  DesignTop = 2
  object BtnRetornar: TIWButton [0]
    AlignWithMargins = False
    Left = 269
    Top = 354
    Width = 120
    Height = 30
    Caption = 'Retornar'
    Color = clBtnFace
    FriendlyName = 'BtnRetornar'
    OnAsyncClick = BtnRetornarAsyncClick
  end
  object BtnConfirmar: TIWButton [1]
    AlignWithMargins = False
    Left = 143
    Top = 354
    Width = 120
    Height = 30
    Caption = 'Confirmar'
    Color = clBtnFace
    FriendlyName = 'BtnConfirmar'
    OnAsyncClick = BtnConfirmarAsyncClick
  end
  object IWLabel5: TIWLabel [2]
    AlignWithMargins = False
    Left = 16
    Top = 3
    Width = 106
    Height = 48
    Font.Color = clNone
    Font.Size = 30
    Font.Style = []
    Font.PxSize = 40
    HasTabOrder = False
    FriendlyName = 'IWLabel5'
    Caption = 'Perfis'
  end
  object IWLabel1: TIWLabel [3]
    AlignWithMargins = False
    Left = 16
    Top = 70
    Width = 60
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Descricao'
  end
  object EdtDescricao: TIWEdit [4]
    AlignWithMargins = False
    Left = 117
    Top = 70
    Width = 388
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtDescricao'
    SubmitOnAsyncEvent = True
    Text = 'EdtDescricao'
  end
  inherited TPS: TIWTemplateProcessorHTML
    Left = 360
    Top = 208
  end
  inherited DataSource1: TDataSource
    Left = 246
    Top = 218
  end
end
