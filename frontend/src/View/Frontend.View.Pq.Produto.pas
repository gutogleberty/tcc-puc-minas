unit Frontend.View.Pq.Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompGrids, IWDBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  IWCompButton, IWVCLBaseContainer, IWContainer, IWHTMLContainer,
  IWHTML40Container, IWRegion, IWCompTabControl, IWCompLabel, IWCompListbox,
  IWCompEdit, IWBSCustomRegion, IWBSRegion, IWCompExtCtrls;

type
  TViewPqProduto = class(TViewPadrao)
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
    BtnRetornar: TIWButton;
    IWRadioGroup1: TIWRadioGroup;
    BtnListar: TIWButton;
    FDMemTable1ESTOQUE: TIntegerField;
    procedure BtnListarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnCadastrarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnAlterarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPqProduto: TViewPqProduto;

implementation

{$R *.dfm}

uses
  Frontend.Model.Produto,
  Frontend.View.MenuPrincipal,
  Frontend.View.Cd.Produto;

procedure TViewPqProduto.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdProduto: TViewCdProduto;
begin
  inherited;
  try
    if FDMemTable1.IsEmpty then
    begin
      WebApplication.ShowMessage('Nenhum registro selecionado');
      Exit;
    end;

    ViewCdProduto :=  TViewCdProduto.Create(WebApplication);
    ViewCdProduto.Status := stAlteracao;
    ViewCdProduto.PrimaryKey := FDMemTable1.FieldByName('codigo').AsInteger;
    ViewCdProduto.Descricao := FDMemTable1.FieldByName('descricao').AsString;
    ViewCdProduto.Fabricante := FDMemTable1.FieldByName('fabricante').AsString;
    ViewCdProduto.Secao := FDMemTable1.FieldByName('secao').AsString;
    ViewCdProduto.ValorUnitario := FDMemTable1.FieldByName('valorunitario').AsCurrency;
    ViewCdProduto.Estoque := FDMemTable1.FieldByName('estoque').AsInteger;
    ViewCdProduto.Show;
    Self.Hide;
  finally
    // ViewCdProduto.Release;
  end;
end;

procedure TViewPqProduto.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdProduto: TViewCdProduto;
begin
  try
    ViewCdProduto :=  TViewCdProduto.Create(WebApplication);
    ViewCdProduto.Status := stInclusao;
    ViewCdProduto.Show;
    Self.Hide;
  finally
    // ViewCdProduto.Release;
  end;
end;

procedure TViewPqProduto.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelProduto.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewPqProduto.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
