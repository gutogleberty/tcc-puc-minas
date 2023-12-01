unit Frontend.View.Pq.Perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, Data.DB, IWCompGrids, IWDBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TViewPqPerfil = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    DBGrid: TIWDBGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1CODIGO: TIntegerField;
    FDMemTable1DESCRICAO: TStringField;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnAlterarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnCadastrarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnListarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPqPerfil: TViewPqPerfil;

implementation

uses
  Frontend.View.MenuPrincipal,
  Frontend.Model.Perfil,
  Frontend.View.Cd.Perfil;

{$R *.dfm}

procedure TViewPqPerfil.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdPerfil: TViewCdPerfil;
begin
  inherited;
  try
    if FDMemTable1.IsEmpty then
    begin
      WebApplication.ShowMessage('Nenhum registro selecionado');
      Exit;
    end;

    ViewCdPerfil :=  TViewCdPerfil.Create(WebApplication);
    ViewCdPerfil.Status := stAlteracao;
    ViewCdPerfil.PrimaryKey := FDMemTable1.FieldByName('codigo').AsInteger;
    ViewCdPerfil.Descricao := FDMemTable1.FieldByName('descricao').AsString;
    ViewCdPerfil.Show;
    Self.Hide;
  finally
    // ViewCdPerfil.Release;
  end;
end;

procedure TViewPqPerfil.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdPerfil: TViewCdPerfil;
begin
  try
    ViewCdPerfil :=  TViewCdPerfil.Create(WebApplication);
    ViewCdPerfil.Status := stInclusao;
    ViewCdPerfil.Show;
    Self.Hide;
  finally
    // ViewCdPerfil.Release;
  end;
end;

procedure TViewPqPerfil.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelPerfil.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewPqPerfil.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
