inherited ViewCdUsuario: TViewCdUsuario
  DesignLeft = 2
  DesignTop = 2
  object ViewCdUsuario: TIWLabel [0]
    AlignWithMargins = False
    Left = 16
    Top = 3
    Width = 165
    Height = 48
    Font.Color = clNone
    Font.Size = 30
    Font.Style = []
    Font.PxSize = 40
    HasTabOrder = False
    FriendlyName = 'ViewCdUsuario'
    Caption = 'Usu'#225'rios'
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
  object BtnRetornar: TIWButton [2]
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
  object IWLabel1: TIWLabel [3]
    AlignWithMargins = False
    Left = 16
    Top = 70
    Width = 36
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Nome'
  end
  object EdtNome: TIWEdit [4]
    AlignWithMargins = False
    Left = 117
    Top = 70
    Width = 388
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtNome'
    SubmitOnAsyncEvent = True
    Text = 'EdtNome'
  end
  object EdtEmail: TIWEdit [5]
    AlignWithMargins = False
    Left = 117
    Top = 118
    Width = 388
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtNome'
    SubmitOnAsyncEvent = True
    Text = 'EdtNome'
  end
  object EdtSenha: TIWEdit [6]
    AlignWithMargins = False
    Left = 117
    Top = 166
    Width = 388
    Height = 32
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtNome'
    SubmitOnAsyncEvent = True
    Text = 'EdtNome'
  end
  object IWLabel2: TIWLabel [7]
    AlignWithMargins = False
    Left = 16
    Top = 122
    Width = 34
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Email'
  end
  object IWLabel3: TIWLabel [8]
    AlignWithMargins = False
    Left = 18
    Top = 171
    Width = 39
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Senha'
  end
  object IWLabel4: TIWLabel [9]
    AlignWithMargins = False
    Left = 18
    Top = 213
    Width = 31
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Perfil'
  end
  object CbbPerfil: TIWComboBox [10]
    AlignWithMargins = False
    Left = 117
    Top = 214
    Width = 388
    Height = 21
    StyleRenderOptions.RenderBorder = False
    ItemIndex = -1
    FriendlyName = 'IWComboBox1'
    NoSelectionText = '-- No Selection --'
  end
  inherited DataSource1: TDataSource
    Left = 254
    Top = 18
  end
end
