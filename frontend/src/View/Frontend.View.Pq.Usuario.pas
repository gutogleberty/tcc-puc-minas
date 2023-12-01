unit Frontend.View.Pq.Usuario;

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
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompButton,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IWCompGrids, IWDBGrids;

type
  TViewPqUsuario = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    DBGrid: TIWDBGrid;
    FDMemTable1: TFDMemTable;
    FDMemTable1CODIGO: TIntegerField;
    FDMemTable1NOME: TStringField;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnCadastrarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnAlterarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnListarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPqUsuario: TViewPqUsuario;

implementation

{$R *.dfm}

uses
  Frontend.View.MenuPrincipal,
  Frontend.View.Cd.Usuario, Frontend.Model.Usuario;

procedure TViewPqUsuario.BtnAlterarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdUsuario: TViewCdUsuario;
begin
  inherited;
  try
    if FDMemTable1.IsEmpty then
    begin
      WebApplication.ShowMessage('Nenhum registro selecionado');
      Exit;
    end;

    ViewCdUsuario :=  TViewCdUsuario.Create(WebApplication);
    ViewCdUsuario.Status := stAlteracao;
    ViewCdUsuario.PrimaryKey := FDMemTable1.FieldByName('codigo').AsInteger;
    ViewCdUsuario.Nome := FDMemTable1.FieldByName('nome').AsString;
    ViewCdUsuario.Show;
    Self.Hide;
  finally
    // ViewCdUsuario.Release;
  end;
end;

procedure TViewPqUsuario.BtnCadastrarAsyncClick(Sender: TObject;
  EventParams: TStringList);
var
  ViewCdUsuario: TViewCdUsuario;
begin
  try
    ViewCdUsuario :=  TViewCdUsuario.Create(WebApplication);
    ViewCdUsuario.Status := stInclusao;
    ViewCdUsuario.Show;
    Self.Hide;
  finally
    // ViewCdUsuario.Release;
  end;
end;

procedure TViewPqUsuario.BtnListarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TModelUsuario.New.Listar(FDMemTable1);
  DBGrid.Refresh;
end;

procedure TViewPqUsuario.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
