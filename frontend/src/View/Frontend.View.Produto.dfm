inherited ViewProduto: TViewProduto
  Width = 840
  ExplicitWidth = 840
  DesignLeft = 2
  DesignTop = 2
  object DBGrid: TIWDBGrid [0]
    AlignWithMargins = False
    Left = 11
    Top = 11
    Width = 617
    Height = 201
    BorderColors.Color = clNone
    BorderColors.Light = clNone
    BorderColors.Dark = clNone
    BGColor = clNone
    BorderSize = 1
    BorderStyle = tfDefault
    Caption = 'DBGrid'
    CellPadding = 0
    CellSpacing = 0
    FrameBuffer = 40
    Lines = tlAll
    UseFrame = True
    UseSize = True
    ShowEmptyCells = True
    ShowInvisibleRows = True
    ScrollToCurrentRow = False
    Columns = <
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Font.PxSize = 13
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'CODIGO'
        LinkField = 'CODIGO'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Font.PxSize = 13
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'CODIGO'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Font.PxSize = 13
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'DESCRICAO'
        LinkField = 'DESCRICAO'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Font.PxSize = 13
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'DESCRICAO'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Font.PxSize = 13
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'FABRICANTE'
        LinkField = 'FABRICANTE'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Font.PxSize = 13
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'CODFABRICANTE'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Font.PxSize = 13
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'SECAO'
        LinkField = 'SECAO'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Font.PxSize = 13
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'CODSECAO'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end
      item
        Alignment = taLeftJustify
        BGColor = clNone
        DoSubmitValidation = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        Font.PxSize = 13
        Header = False
        Height = '0'
        ShowHint = True
        VAlign = vaMiddle
        Visible = True
        Width = '0'
        Wrap = False
        RawText = False
        Css = ''
        BlobCharLimit = 0
        CompareHighlight = hcNone
        DataField = 'VALORUNITARIO'
        LinkField = 'VALORUNITARIO'
        Title.Alignment = taCenter
        Title.BGColor = clNone
        Title.DoSubmitValidation = True
        Title.Font.Color = clNone
        Title.Font.Size = 10
        Title.Font.Style = []
        Title.Font.PxSize = 13
        Title.Header = False
        Title.Height = '0'
        Title.ShowHint = True
        Title.Text = 'VALORUNITARIO'
        Title.VAlign = vaMiddle
        Title.Visible = True
        Title.Width = '0'
        Title.Wrap = False
        Title.RawText = True
      end>
    DataSource = DataSource1
    FooterRowCount = 0
    FriendlyName = 'DBGrid'
    FromStart = True
    HighlightColor = clNone
    HighlightRows = False
    Options = [dgShowTitles]
    RefreshMode = rmAutomatic
    RowLimit = 0
    RollOver = False
    RowClick = False
    RollOverColor = clNone
    RowHeaderColor = clNone
    RowAlternateColor = clNone
    RowCurrentColor = clNone
  end
  object BtnExcluir: TIWButton [1]
    AlignWithMargins = False
    Left = 688
    Top = 182
    Width = 120
    Height = 30
    Caption = 'Excluir'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
  end
  object BtnAlterar: TIWButton [2]
    AlignWithMargins = False
    Left = 688
    Top = 134
    Width = 120
    Height = 30
    Caption = 'Alterar'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnAsyncClick = BtnAlterarAsyncClick
  end
  object BtnCadastrar: TIWButton [3]
    AlignWithMargins = False
    Left = 688
    Top = 86
    Width = 120
    Height = 30
    Caption = 'Cadastrar'
    Color = clBtnFace
    FriendlyName = 'BtnCadastrar'
    OnAsyncClick = BtnCadastrarAsyncClick
  end
  object BtnListar: TIWButton [4]
    AlignWithMargins = False
    Left = 688
    Top = 38
    Width = 120
    Height = 30
    Caption = 'Listar'
    Color = clBtnFace
    FriendlyName = 'BtnListar'
    OnAsyncClick = BtnListarAsyncClick
  end
  object BtnRetornar: TIWButton [5]
    AlignWithMargins = False
    Left = 688
    Top = 218
    Width = 120
    Height = 30
    Caption = 'Retornar'
    Color = clBtnFace
    FriendlyName = 'BtnRetornar'
    OnAsyncClick = BtnRetornarAsyncClick
  end
  inherited TPS: TIWTemplateProcessorHTML
    Left = 208
    Top = 16
  end
  inherited DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 374
    Top = 306
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 446
    Top = 306
    object FDMemTable1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTable1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object FDMemTable1FABRICANTE: TStringField
      FieldName = 'FABRICANTE'
      Size = 30
    end
    object FDMemTable1SECAO: TStringField
      FieldName = 'SECAO'
      Size = 30
    end
    object FDMemTable1VALORUNITARIO: TCurrencyField
      FieldName = 'VALORUNITARIO'
    end
  end
end
