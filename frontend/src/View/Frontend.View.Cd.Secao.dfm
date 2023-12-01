inherited ViewCdSecao: TViewCdSecao
  OnShow = IWAppFormShow
  DesignLeft = 2
  DesignTop = 2
  object ViewSecao: TIWLabel [0]
    AlignWithMargins = False
    Left = 16
    Top = 3
    Width = 114
    Height = 48
    Font.Color = clNone
    Font.Size = 30
    Font.Style = []
    Font.PxSize = 40
    HasTabOrder = False
    FriendlyName = 'ViewSecao'
    Caption = 'Se'#231#227'o'
  end
  object IWLabel1: TIWLabel [1]
    AlignWithMargins = False
    Left = 16
    Top = 70
    Width = 60
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Descricao'
  end
  object EdtDescricao: TIWEdit [2]
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
  object BtnConfirmar: TIWButton [3]
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
  object BtnRetornar: TIWButton [4]
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
  inherited TPS: TIWTemplateProcessorHTML
    Left = 312
    Top = 208
  end
  inherited DataSource1: TDataSource
    Left = 414
    Top = 178
  end
end
