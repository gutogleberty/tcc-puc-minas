unit Frontend.View.MenuPrincipal;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  Vcl.Controls,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompButton,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML,
  IWCompGrids,
  IWDBGrids,
  IWCompMenu,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  System.JSON,
  REST.Types;

type
  TViewMenuPrincipal = class(TIWAppForm)
    IWTemplateProcessorHTML1: TIWTemplateProcessorHTML;
    IWMenu1: TIWMenu;
    BtnProduto: TIWButton;
    BtnFabricantes: TIWButton;
    BtnSecao: TIWButton;
    BtnPerfil: TIWButton;
    BtnUsuario: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BtnProdutoClick(Sender: TObject);
    procedure BtnFabricantesClick(Sender: TObject);
    procedure BtnSecaoClick(Sender: TObject);
    procedure BtnPerfilClick(Sender: TObject);
    procedure BtnUsuarioClick(Sender: TObject);
  public
    procedure ConfiguraControles;
  end;

implementation

{$R *.dfm}

uses
  Frontend.Model.Produto,
  Frontend.View.Fabricante,
  Frontend.View.Perfil,
  Frontend.View.Produto,
  Frontend.View.Secao,
  Frontend.View.Usuario;

procedure TViewMenuPrincipal.BtnFabricantesClick(Sender: TObject);
begin
  TViewFabricante.Create(WebApplication).Show;
end;

procedure TViewMenuPrincipal.BtnPerfilClick(Sender: TObject);
begin
  TViewPerfil.Create(WebApplication).Show;
end;

procedure TViewMenuPrincipal.BtnProdutoClick(Sender: TObject);
begin
  TViewProduto.Create(WebApplication).Show;
end;

procedure TViewMenuPrincipal.BtnSecaoClick(Sender: TObject);
begin
  TViewSecao.Create(WebApplication).Show;
end;

procedure TViewMenuPrincipal.BtnUsuarioClick(Sender: TObject);
begin
  TViewUsuario.Create(WebApplication).Show;
end;

procedure TViewMenuPrincipal.ConfiguraControles;
begin
  IWTemplateProcessorHTML1.RenderStyles := False;
  LayoutMgr := IWTemplateProcessorHTML1;
end;

procedure TViewMenuPrincipal.IWAppFormCreate(Sender: TObject);
begin
  ConfiguraControles;
end;

//initialization
//  TViewMenuPrincipal.SetAsMainForm;

end.


