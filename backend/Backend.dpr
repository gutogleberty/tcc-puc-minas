program Backend;

uses
  Vcl.SvcMgr,
  {$IF defined(BACKEND) and defined(APLICACAO)}
  Vcl.Forms,
  {$ENDIF }
  MainService in 'src\Controller\MainService.pas' {Service1: TService},
  Backend.View.Aplicacao in 'src\View\Backend.View.Aplicacao.pas' {ViewAplicacao},
  Backend.Controller.Produto in 'src\Controller\Backend.Controller.Produto.pas',
  Backend.Model.Produto in 'src\Model\Backend.Model.Produto.pas',
  Backend.Dao.ConexaoPadrao in 'src\Dao\Backend.Dao.ConexaoPadrao.pas' {DaoConexaoPadrao: TDataModule},
  Backend.Dao.Produto in 'src\Dao\Backend.Dao.Produto.pas' {DaoProduto: TDataModule},
  Backend.Controller.Fabricante in 'src\Controller\Backend.Controller.Fabricante.pas',
  Backend.Model.Fabricante in 'src\Model\Backend.Model.Fabricante.pas',
  Backend.Dao.Fabricante in 'src\Dao\Backend.Dao.Fabricante.pas' {DaoFabricante: TDataModule},
  Backend.Controller.Secao in 'src\Controller\Backend.Controller.Secao.pas',
  Backend.Model.Secao in 'src\Model\Backend.Model.Secao.pas',
  Backend.Dao.Secao in 'src\Dao\Backend.Dao.Secao.pas' {DaoSecao: TDataModule},
  Backend.Controller.Usuario in 'src\Controller\Backend.Controller.Usuario.pas',
  Backend.Model.Usuario in 'src\Model\Backend.Model.Usuario.pas',
  Backend.Dao.Usuario in 'src\Dao\Backend.Dao.Usuario.pas' {DaoUsuario: TDataModule},
  Backend.Controller.Perfil in 'src\Controller\Backend.Controller.Perfil.pas',
  Backend.Model.Perfil in 'src\Model\Backend.Model.Perfil.pas',
  Backend.Dao.Perfil in 'src\Dao\Backend.Dao.Perfil.pas' {DaoPerfil: TDataModule};

const
  CodigoModuloAplicativo: Integer = 1;
  DescricaoVersaoAplicativo: string = '1.0i';
  ServicePack: string = '';
  VersaoServidorAplicacao: Integer = 4;
  VersaoMinimaBanco: Integer = 58;
  DataCopilação: string = '27/09/2023';
  HoraCopilação: string = '12:30';

{$R *.RES}

procedure ExecutarTipoAplicacao;
begin
  {$IF defined(BACKEND) and defined(APLICACAO)}

  {$IFDEF DEBUG}
    ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}

  Vcl.Forms.Application.Initialize;

  Vcl.Forms.Application.CreateForm(TViewAplicacao, ViewAplicacao);
  Vcl.Forms.Application.Run;
  {$ENDIF}
end;

begin
  // Windows 2003 Server requires StartServiceCtrlDispatcher to be
  // called before CoRegisterClassObject, which can be called indirectly
  // by Application.Initialize. TServiceApplication.DelayInitialize allows
  // Application.Initialize to be called from TService.Main (after
  // StartServiceCtrlDispatcher has been called).
  //
  // Delayed initialization of the Application object may affect
  // events which then occur prior to initialization, such as
  // TService.OnCreate. It is only recommended if the ServiceApplication
  // registers a class object with OLE and is intended for use with
  // Windows 2003 Server.
  //
  // Application.DelayInitialize := True;
  //
  {$IF defined(BACKEND) and not defined(APLICACAO)}
  if not Application.DelayInitialize or Application.Installing then
    Application.Initialize;
  //
  Application.CreateForm(TG2ServerService, G2ServerService);
  //
  Application.Run;
  {$ELSEIF defined(BACKEND) and defined(APLICACAO)}
    Vcl.Forms.Application.Initialize;
    ExecutarTipoAplicacao;
  {$ENDIF}
end.
