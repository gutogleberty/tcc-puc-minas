inherited ViewCdProduto: TViewCdProduto
  OnShow = IWAppFormShow
  DesignLeft = 2
  DesignTop = 2
  object EdtDescricao: TIWEdit [0]
    AlignWithMargins = False
    Left = 117
    Top = 70
    Width = 388
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtDescricao'
    SubmitOnAsyncEvent = True
  end
  object EdtValorUnitario: TIWEdit [1]
    AlignWithMargins = False
    Left = 117
    Top = 183
    Width = 92
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    DataType = stNumber
  end
  object IWLabel1: TIWLabel [2]
    AlignWithMargins = False
    Left = 16
    Top = 70
    Width = 60
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Descricao'
  end
  object IWLabel2: TIWLabel [3]
    AlignWithMargins = False
    Left = 16
    Top = 108
    Width = 66
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Fabricante'
  end
  object IWLabel3: TIWLabel [4]
    AlignWithMargins = False
    Left = 16
    Top = 152
    Width = 38
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Se'#231#227'o'
  end
  object IWLabel4: TIWLabel [5]
    AlignWithMargins = False
    Left = 16
    Top = 188
    Width = 35
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Pre'#231'o'
  end
  object IWLabel5: TIWLabel [6]
    AlignWithMargins = False
    Left = 16
    Top = 3
    Width = 170
    Height = 48
    Font.Color = clNone
    Font.Size = 30
    Font.Style = []
    Font.PxSize = 40
    HasTabOrder = False
    FriendlyName = 'IWLabel5'
    Caption = 'Produtos'
  end
  object BtnRetornar: TIWButton [7]
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
  object BtnConfirmar: TIWButton [8]
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
  object EdtEstoque: TIWEdit [9]
    AlignWithMargins = False
    Left = 117
    Top = 221
    Width = 92
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtEstoque'
    SubmitOnAsyncEvent = True
    DataType = stNumber
  end
  object IWLabel6: TIWLabel [10]
    AlignWithMargins = False
    Left = 16
    Top = 227
    Width = 49
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Estoque'
  end
  object EdtFabricante: TIWEdit [11]
    AlignWithMargins = False
    Left = 117
    Top = 106
    Width = 92
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtFabricante'
    SubmitOnAsyncEvent = True
    DataType = stNumber
  end
  object EdtSecao: TIWEdit [12]
    AlignWithMargins = False
    Left = 117
    Top = 144
    Width = 92
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    DataType = stNumber
  end
  inherited TPS: TIWTemplateProcessorHTML
    Left = 440
  end
  inherited DataSource1: TDataSource
    Left = 382
  end
end
