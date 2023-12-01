unit Frontend.View.Pq.Fabricante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompGrids, IWDBGrids,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWCompButton,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TViewPqFabricante = class(TViewPadrao)
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    DBGrid: TIWDBGrid;
    BtnRetornar: TIWButton;
    BtnListar: TIWButton;
    FDMemTable1: TFDMemTable;
    FDMemTable1CODIGO: TIntegerField;
    FDMemTable1DESCRICAO: TStringField;
    procedure BtnCadastrarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnAlterarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnListarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPqFabricante: TViewPqFabricante;

implementation

uses
  Frontend.View.Cd.Fabricante,
  Frontend.Model.Fabricante,
  Frontend.View.MenuPrincipal;

{$R *.dfm}

procedure TViewPqFabricante.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdFabricante: TViewCdFabricante;
begin
  inherited;
  try
    if FDMemTable1.IsEmpty then
    begin
      WebApplication.ShowMessage('Nenhum registro selecionado');
      Exit;
    end;

    ViewCdFabricante :=  TViewCdFabricante.Create(WebApplication);
    ViewCdFabricante.Status := stAlteracao;
    ViewCdFabricante.PrimaryKey := FDMemTable1.FieldByName('codigo').AsInteger;
    ViewCdFabricante.Descricao := FDMemTable1.FieldByName('descricao').AsString;
    ViewCdFabricante.Show;
    Self.Hide;
  finally
    // ViewCdFabricante.Release;
  end;
end;

procedure TViewPqFabricante.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdFabricante: TViewCdFabricante;
begin
  try
    ViewCdFabricante :=  TViewCdFabricante.Create(WebApplication);
    ViewCdFabricante.Status := stInclusao;
    ViewCdFabricante.Show;
    Self.Hide;
  finally
    // ViewCdFabricante.Release;
  end;
end;

procedure TViewPqFabricante.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelFabricante.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewPqFabricante.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
