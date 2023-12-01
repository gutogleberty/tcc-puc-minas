unit Frontend.View.Pq.Secao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl,
  IWBaseControl, IWBaseHTMLControl, IWControl, IWCompGrids, IWDBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TViewPqSecao = class(TViewPadrao)
    DBGrid: TIWDBGrid;
    BtnCadastrar: TIWButton;
    BtnAlterar: TIWButton;
    BtnExcluir: TIWButton;
    BtnRetornar: TIWButton;
    BtnListar: TIWButton;
    FDMemTable1: TFDMemTable;
    FDMemTable1CODIGO: TIntegerField;
    FDMemTable1DESCRICAO: TStringField;
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
  ViewPqSecao: TViewPqSecao;

implementation

uses
  Frontend.View.Cd.Secao, Frontend.Model.Secao, Frontend.View.MenuPrincipal;

{$R *.dfm}

procedure TViewPqSecao.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdSecao: TViewCdSecao;
begin
  inherited;
  try
    if FDMemTable1.IsEmpty then
    begin
      WebApplication.ShowMessage('Nenhum registro selecionado');
      Exit;
    end;

    ViewCdSecao :=  TViewCdSecao.Create(WebApplication);
    ViewCdSecao.Status := stAlteracao;
    ViewCdSecao.PrimaryKey := FDMemTable1.FieldByName('codigo').AsInteger;
    ViewCdSecao.Descricao := FDMemTable1.FieldByName('descricao').AsString;
    ViewCdSecao.Show;
    Self.Hide;
  finally
    // ViewCdPerfil.Release;
  end;
end;

procedure TViewPqSecao.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdSecao: TViewCdSecao;
begin
  try
    ViewCdSecao :=  TViewCdSecao.Create(WebApplication);
    ViewCdSecao.Status := stInclusao;
    ViewCdSecao.Show;
    Self.Hide;
  finally
    // ViewCdPerfil.Release;
  end;
end;

procedure TViewPqSecao.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelSecao.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewPqSecao.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
