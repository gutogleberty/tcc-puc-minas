inherited ViewPqFabricante: TViewPqFabricante
  Width = 829
  ExplicitWidth = 829
  DesignLeft = 2
  DesignTop = 2
  object BtnExcluir: TIWButton [0]
    AlignWithMargins = False
    Left = 670
    Top = 75
    Width = 120
    Height = 30
    Caption = 'Excluir'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
  end
  object BtnAlterar: TIWButton [1]
    AlignWithMargins = False
    Left = 670
    Top = 39
    Width = 120
    Height = 30
    Caption = 'Alterar'
    Color = clBtnFace
    FriendlyName = 'IWButton1'
    OnAsyncClick = BtnAlterarAsyncClick
  end
  object BtnCadastrar: TIWButton [2]
    AlignWithMargins = False
    Left = 670
    Top = 3
    Width = 120
    Height = 30
    Caption = 'Novo'
    Color = clBtnFace
    FriendlyName = 'BtnNovo'
    OnAsyncClick = BtnCadastrarAsyncClick
  end
  object DBGrid: TIWDBGrid [3]
    AlignWithMargins = False
    Left = 13
    Top = 3
    Width = 651
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
        Title.Text = 'C'#243'digo'
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
        Title.Text = 'Descri'#231#227'o'
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
  object BtnRetornar: TIWButton [4]
    AlignWithMargins = False
    Left = 670
    Top = 147
    Width = 120
    Height = 30
    Caption = 'Retornar'
    Color = clBtnFace
    FriendlyName = 'BtnRetornar'
    OnAsyncClick = BtnRetornarAsyncClick
  end
  object BtnListar: TIWButton [5]
    AlignWithMargins = False
    Left = 670
    Top = 111
    Width = 120
    Height = 30
    Caption = 'Listar'
    Color = clBtnFace
    FriendlyName = 'BtnListar'
    OnAsyncClick = BtnListarAsyncClick
  end
  inherited DataSource1: TDataSource
    DataSet = FDMemTable1
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 318
    Top = 218
    object FDMemTable1CODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object FDMemTable1DESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
end
