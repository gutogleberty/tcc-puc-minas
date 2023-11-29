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
  Frontend.View.Fabricante in 'src\View\Frontend.View.Fabricante.pas' {ViewFabricante: TIWAppForm},
  Frontend.View.Secao in 'src\View\Frontend.View.Secao.pas' {ViewSecao: TIWAppForm},
  Frontend.View.MenuPrincipal in 'src\View\Frontend.View.MenuPrincipal.pas' {ViewMenuPrincipal: TIWAppForm},
  Template.StartAdmin in 'src\Library\Template.StartAdmin.pas',
  Frontend.View.Login in 'src\View\Frontend.View.Login.pas' {ViewLogin: TIWAppForm},
  Frontend.View.Produto in 'src\View\Frontend.View.Produto.pas' {ViewProduto: TIWAppForm},
  Frontend.View.Usuario in 'src\View\Frontend.View.Usuario.pas' {ViewUsuario: TIWAppForm},
  Frontend.View.Perfil in 'src\View\Frontend.View.Perfil.pas' {ViewPerfil: TIWAppForm},
  Frontend.View.Padrao in 'src\View\Frontend.View.Padrao.pas' {ViewPadrao: TIWAppForm};

{$R *.res}

begin
  TIWStart.Execute(True);
end.

// https://www.youtube.com/playlist?list=PLxNM4ef1BpxhqmSHCti-UEd5_by9xEG2d
// https://universidadedelphi.com.br/maratonaiw
// https://github.com/Atozed/IntraWeb/tree/master
// https://www.youtube.com/@intrawebbrasiliwbr9641/videos
//https://novoead.com.br/aula/1651232968742x897897723235663900
// curso > https://p.eduzz.com/44056

// Maratona Intraweb 2021 (100%)
// https://www.youtube.com/watch?v=c-eapUdzxUQ&list=PLe3pgSSTNw4PD9GWnCcqWKMR3Ujb1rXMc&index=4

// https://www.w3schools.com/bootstrap/bootstrap_ver.asp
