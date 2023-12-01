program Frontend;

uses
  FastMM4,
  IWRtlFix,
  IWJclStackTrace,
  IWJclDebug,
  IWStart,
  Frontend.Model.RequestRestPadrao.Interfaces in 'src\Model\Frontend.Model.RequestRestPadrao.Interfaces.pas',
  Frontend.Model.RequestRestPadrao in 'src\Model\Frontend.Model.RequestRestPadrao.pas',
  Frontend.Model.Produto.Interfaces in 'src\Model\Frontend.Model.Produto.Interfaces.pas',
  Frontend.Model.Produto in 'src\Model\Frontend.Model.Produto.pas',
  Frontend.Model.Fabricante.Interfaces in 'src\Model\Frontend.Model.Fabricante.Interfaces.pas',
  Frontend.Model.Secao.Interfaces in 'src\Model\Frontend.Model.Secao.Interfaces.pas',
  Frontend.Model.Usuario.Interfaces in 'src\Model\Frontend.Model.Usuario.Interfaces.pas',
  Frontend.Model.Perfil.Interfaces in 'src\Model\Frontend.Model.Perfil.Interfaces.pas',
  Frontend.Model.Fabricante in 'src\Model\Frontend.Model.Fabricante.pas',
  Frontend.Model.Secao in 'src\Model\Frontend.Model.Secao.pas',
  Frontend.Model.Usuario in 'src\Model\Frontend.Model.Usuario.pas',
  Frontend.Model.Perfil in 'src\Model\Frontend.Model.Perfil.pas',
  ServerController in 'src\Controller\ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'src\Controller\UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Frontend.View.MenuPrincipal in 'src\View\Frontend.View.MenuPrincipal.pas' {ViewMenuPrincipal: TIWAppForm},
  Template.StartAdmin in 'src\Library\Template.StartAdmin.pas',
  Frontend.View.Login in 'src\View\Frontend.View.Login.pas' {ViewLogin: TIWAppForm},
  Frontend.View.Pq.Produto in 'src\View\Frontend.View.Pq.Produto.pas' {ViewPqProduto: TIWAppForm},
  Frontend.View.Pq.Usuario in 'src\View\Frontend.View.Pq.Usuario.pas' {ViewPqUsuario: TIWAppForm},
  Frontend.View.Pq.Perfil in 'src\View\Frontend.View.Pq.Perfil.pas' {ViewPqPerfil: TIWAppForm},
  Frontend.View.Padrao in 'src\View\Frontend.View.Padrao.pas' {ViewPadrao: TIWAppForm},
  Unit1 in 'Unit1.pas' {IWFrame1: TFrame},
  Frontend.View.Cd.Fabricante in 'src\View\Frontend.View.Cd.Fabricante.pas' {ViewCdFabricante: TIWAppForm},
  Frontend.View.Cd.Produto in 'src\View\Frontend.View.Cd.Produto.pas' {ViewCdProduto: TIWAppForm},
  Frontend.View.Cd.Perfil in 'src\View\Frontend.View.Cd.Perfil.pas' {ViewCdPerfil: TIWAppForm},
  Frontend.View.Cd.Usuario in 'src\View\Frontend.View.Cd.Usuario.pas' {ViewCdUsuario: TIWAppForm},
  Frontend.View.Cd.Secao in 'src\View\Frontend.View.Cd.Secao.pas' {ViewCdSecao: TIWAppForm},
  Frontend.View.Pq.Fabricante in 'src\View\Frontend.View.Pq.Fabricante.pas' {ViewPqFabricante: TIWAppForm},
  Frontend.View.Pq.Secao in 'src\View\Frontend.View.Pq.Secao.pas' {ViewPqSecao: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.


