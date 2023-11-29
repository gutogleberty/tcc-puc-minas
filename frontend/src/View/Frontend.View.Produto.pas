unit Frontend.View.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompGrids, IWDBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IWCompButton;

type
  TViewProduto = class(TViewPadrao)
    DBGrid: TIWDBGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1CODIGO: TIntegerField;
    FDMemTable1DESCRICAO: TStringField;
    FDMemTable1FABRICANTE: TStringField;
    FDMemTable1SECAO: TStringField;
    FDMemTable1VALORUNITARIO: TCurrencyField;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    BtnRetornar: TIWButton;
    procedure BtnListarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnCadastrarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnAlterarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewProduto: TViewProduto;

implementation

{$R *.dfm}

uses
  Frontend.Model.Produto,
  Frontend.View.MenuPrincipal;

procedure TViewProduto.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelProduto.New
    .Codigo(FDMemTable1.FieldByName('codigo').AsInteger)
    .Descricao('MOUSE USB 3 ALTERADO')
    .CodFabricante(1)
    .CodSecao(1)
    .ValorUnitario(11)
    .Alterar;
  DBGrid.Refresh;
end;

procedure TViewProduto.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelProduto.New
    .Descricao('MOUSE USB 3')
    .CodFabricante(1)
    .CodSecao(1)
    .ValorUnitario(11)
    .Cadastrar;
  DBGrid.Refresh;
end;

procedure TViewProduto.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelProduto.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewProduto.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
