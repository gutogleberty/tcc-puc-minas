object ViewMenuPrincipal: TViewMenuPrincipal
  Left = 0
  Top = 0
  Width = 927
  Height = 558
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = IWTemplateProcessorHTML1
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object IWMenu1: TIWMenu
    AlignWithMargins = False
    Left = 352
    Top = 324
    Width = 200
    Height = 20
    FriendlyName = 'IWMenu1'
    ItemSpacing = itsNone
    AutoSize = mnaNone
    MainMenuStyle.MenuItemFont.Color = clNone
    MainMenuStyle.MenuItemFont.Size = 10
    MainMenuStyle.MenuItemFont.Style = []
    MainMenuStyle.MenuItemFont.PxSize = 13
    MainMenuStyle.SelectedMenuItemFont.Color = clNone
    MainMenuStyle.SelectedMenuItemFont.Size = 10
    MainMenuStyle.SelectedMenuItemFont.Style = []
    MainMenuStyle.SelectedMenuItemFont.PxSize = 13
    MainMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
    MainMenuStyle.DisabledMenuItemFont.Size = 10
    MainMenuStyle.DisabledMenuItemFont.Style = []
    MainMenuStyle.DisabledMenuItemFont.PxSize = 13
    MainMenuStyle.BGColor = 14933984
    MainMenuStyle.ItemBGColor = clNone
    MainMenuStyle.SelectedItemBGColor = clNone
    MainMenuStyle.DisabledItemBGColor = clNone
    MainMenuStyle.BorderColor = clNone
    MainMenuStyle.Orientation = iwOHorizontal
    SubMenuStyle.MenuItemFont.Color = clNone
    SubMenuStyle.MenuItemFont.Size = 10
    SubMenuStyle.MenuItemFont.Style = []
    SubMenuStyle.MenuItemFont.PxSize = 13
    SubMenuStyle.SelectedMenuItemFont.Color = clNone
    SubMenuStyle.SelectedMenuItemFont.Size = 10
    SubMenuStyle.SelectedMenuItemFont.Style = []
    SubMenuStyle.SelectedMenuItemFont.PxSize = 13
    SubMenuStyle.DisabledMenuItemFont.Color = clWebSILVER
    SubMenuStyle.DisabledMenuItemFont.Size = 10
    SubMenuStyle.DisabledMenuItemFont.Style = []
    SubMenuStyle.DisabledMenuItemFont.PxSize = 13
    SubMenuStyle.BGColor = clNone
    SubMenuStyle.ItemBGColor = clNone
    SubMenuStyle.SelectedItemBGColor = clNone
    SubMenuStyle.DisabledItemBGColor = clNone
    SubMenuStyle.BorderColor = clNone
    SubMenuStyle.Orientation = iwOVertical
    TimeOut = 0
  end
  object BtnProduto: TIWButton
    AlignWithMargins = False
    Left = 298
    Top = 116
    Width = 300
    Height = 30
    Caption = 'Produtos'
    Color = clBtnFace
    FriendlyName = 'BtnProduto'
    OnClick = BtnProdutoClick
  end
  object BtnFabricantes: TIWButton
    AlignWithMargins = False
    Left = 298
    Top = 152
    Width = 300
    Height = 30
    Caption = 'Fabricantes'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnClick = BtnFabricantesClick
  end
  object BtnSecao: TIWButton
    AlignWithMargins = False
    Left = 298
    Top = 188
    Width = 300
    Height = 30
    Caption = 'Se'#231#245'es'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnClick = BtnSecaoClick
  end
  object BtnPerfil: TIWButton
    AlignWithMargins = False
    Left = 298
    Top = 224
    Width = 300
    Height = 30
    Caption = 'Perfil'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnClick = BtnPerfilClick
  end
  object BtnUsuario: TIWButton
    AlignWithMargins = False
    Left = 298
    Top = 260
    Width = 300
    Height = 30
    Caption = 'Usu'#225'rio'
    Color = clBtnFace
    FriendlyName = 'Usu'#225'rio'
    OnClick = BtnUsuarioClick
  end
  object IWLabel1: TIWLabel
    AlignWithMargins = False
    Left = 16
    Top = 16
    Width = 257
    Height = 81
    Font.Color = clWebBLUE
    Font.Size = 50
    Font.Style = []
    Font.PxSize = 66
    HasTabOrder = False
    FriendlyName = 'IWLabel1'
    Caption = 'G2INFO'
  end
  object IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    TagType = ttIntraWeb
    RenderStyles = False
    Left = 432
    Top = 400
  end
end
