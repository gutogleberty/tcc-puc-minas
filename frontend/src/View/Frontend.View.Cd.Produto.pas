unit Frontend.View.Cd.Produto;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Frontend.View.Padrao,
  Data.DB,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML,
  IWCompLabel,
  IWCompListbox,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompEdit,
  IWCompButton;

type
  TViewCdProduto = class(TViewPadrao)
    EdtDescricao: TIWEdit;
    EdtValorUnitario: TIWEdit;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    BtnRetornar: TIWButton;
    BtnConfirmar: TIWButton;
    EdtEstoque: TIWEdit;
    IWLabel6: TIWLabel;
    EdtFabricante: TIWEdit;
    EdtSecao: TIWEdit;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnConfirmarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormShow(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfiguraControles;
  public
    { Public declarations }
    Descricao: string;
    Fabricante: string;
    Secao: string;
    ValorUnitario: Currency;
    Estoque: Integer;
  end;

var
  ViewCdProduto: TViewCdProduto;

implementation

uses
  Frontend.Model.Produto,
  Frontend.View.Pq.Produto;

{$R *.dfm}

procedure TViewCdProduto.BtnConfirmarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  case Status of
    stInclusao:
    begin
      TModelProduto.New
        .Descricao(EdtDescricao.Text)
        .CodFabricante(StrToInt(EdtFabricante.Text))
        .CodSecao(StrToInt(EdtSecao.Text))
        .ValorUnitario(StrToCurr(EdtValorUnitario.Text))
        .Cadastrar;
        WebApplication.ShowMessage('Produto cadastrado com sucesso');
    end;
    stAlteracao:
      begin
        TModelProduto.New
          .Codigo(PrimaryKey)
          .Descricao(EdtDescricao.Text)
          .CodFabricante(StrToInt(EdtFabricante.Text))
          .CodSecao(StrToInt(EdtSecao.Text))
          .ValorUnitario(StrToCurr(EdtValorUnitario.Text)).Alterar;
          WebApplication.ShowMessage('Produto aletrado com sucesso');
      end;
  end;
end;

procedure TViewCdProduto.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewPqProduto.Create(WebApplication).Show;
end;

procedure TViewCdProduto.ConfiguraControles;
begin
  //
end;

procedure TViewCdProduto.IWAppFormCreate(Sender: TObject);
begin
  inherited;
  ConfiguraControles;
end;

procedure TViewCdProduto.IWAppFormShow(Sender: TObject);
begin
  inherited;
  if Status = stAlteracao then
  begin
    EdtDescricao.Text := Descricao;
    // EdtFabricante.Text := Fabricante: Integer;
    // EdtSecao.Text := Secao: Integer;
    EdtValorUnitario.Text := CurrToStr(ValorUnitario);
    EdtEstoque.Text := IntToStr(Estoque);
  end;
end;

end.
