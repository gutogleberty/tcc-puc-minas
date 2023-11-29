object ViewPadrao: TViewPadrao
  Left = 0
  Top = 0
  Width = 555
  Height = 400
  RenderInvisibleControls = True
  AllowPageAccess = True
  ConnectionMode = cmAny
  OnCreate = IWAppFormCreate
  Background.Fixed = False
  LayoutMgr = TPS
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  DesignLeft = 2
  DesignTop = 2
  object TPS: TIWTemplateProcessorHTML
    MasterFormTag = False
    TagType = ttIntraWeb
    OnUnknownTag = TPSUnknownTag
    RenderStyles = False
    Left = 192
    Top = 24
  end
  object DataSource1: TDataSource
    Left = 70
    Top = 26
  end
end
