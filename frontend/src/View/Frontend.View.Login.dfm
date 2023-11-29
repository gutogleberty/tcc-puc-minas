inherited ViewLogin: TViewLogin
  DesignLeft = 2
  DesignTop = 2
  object BtnOK: TIWButton [0]
    AlignWithMargins = False
    Left = 136
    Top = 176
    Width = 120
    Height = 30
    Caption = 'Entrar'
    Color = clBtnFace
    FriendlyName = 'BtnOK'
    OnAsyncClick = BtnOKAsyncClick
  end
  object EdtUsuario: TIWEdit [1]
    AlignWithMargins = False
    Left = 114
    Top = 88
    Width = 200
    Height = 32
    OnHTMLTag = EdtUsuarioHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'EdtUsuario'
    SubmitOnAsyncEvent = True
  end
  object EdtSenha: TIWEdit [2]
    AlignWithMargins = False
    Left = 114
    Top = 126
    Width = 200
    Height = 32
    OnHTMLTag = EdtSenhaHTMLTag
    Css = 'form-control'
    StyleRenderOptions.RenderBorder = False
    FriendlyName = 'IWEdit1'
    SubmitOnAsyncEvent = True
    DataType = stPassword
  end
  object IWLabel1: TIWLabel [3]
    AlignWithMargins = False
    Left = 24
    Top = 88
    Width = 47
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Usu'#225'rio'
  end
  object IWLabel2: TIWLabel [4]
    AlignWithMargins = False
    Left = 32
    Top = 126
    Width = 39
    Height = 16
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'Senha'
  end
end
