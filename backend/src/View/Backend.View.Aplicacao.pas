unit Backend.View.Aplicacao;

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
  Vcl.ExtCtrls,
  Vcl.SvcMgr,
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,
  Horse.GBSwagger,
  Horse.BasicAuthentication,
  FireDAC.Comp.Client,
  System.Hash,
  Data.DB,
  IdHashMessageDigest,
  Vcl.StdCtrls,
  System.JSON,
  REST.Types,
  Vcl.Menus,
  Vcl.AppEvnts;

type
  TViewAplicacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    fechar1: TMenuItem;
    Restaurar1: TMenuItem;
    N1: TMenuItem;
    ApplicationEvents1: TApplicationEvents;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Minimize(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure fechar1Click(Sender: TObject);
  private
    { Private declarations }
    procedure AposServiceStart;
    procedure ServiceStart(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
  public
    { Public declarations }
    procedure ConfiguraControles;
  end;

var
  ViewAplicacao: TViewAplicacao;

implementation

{$R *.dfm}

procedure TViewAplicacao.FormCreate(Sender: TObject);
begin
  ConfiguraControles;
  ServiceCreate(Self);
  AposServiceStart;
  ServiceStart(Self);
end;

procedure TViewAplicacao.FormShow(Sender: TObject);
begin
  Label1.Caption := 'Servidor de Aplicação ' + ' - Versão: ' + '1.0';
end;

procedure TViewAplicacao.Timer1Timer(Sender: TObject);
begin
  WindowState := TWindowState.wsMinimized;
  Timer1.Enabled := False;
  // Controllers.Licenca.Validar;
end;

procedure TViewAplicacao.TrayIcon1DblClick(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Vcl.Forms.Application.BringToFront();
end;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  // MainServiceFrm.Controller(CtrlCode);
end;

//function TForm1.GetServiceController: TServiceController;
//begin
  // Result := ServiceController;
//end;

procedure TViewAplicacao.ServiceCreate(Sender: TObject);
begin
  try
    THorse
      .USe(Compression())
      .Use(Jhonson())
      .Use(HandleException)
      .Use(HorseSwagger)
      .Use(HorseBasicAuthentication(
      function(const AUsername, APassword: string): Boolean
      begin
        // Here inside you can access your database and validate if username and password are valid
        // Result := AUsername.Equals('user') and APassword.Equals('password');
        Result := AUsername.Equals('pucminasusername') and APassword.Equals('pucminaspassword');
      end));

  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Service Create' + sLineBreak +
//                  'Mensagem: ' + E.Message + sLineBreak +
//                  'Unit: ' + 'MainService')
//        .WriteLogLine;
//    end;
    end;
  end;
end;

procedure TViewAplicacao.ServiceStart(Sender: TObject);
begin
  try
    THorse.Listen(9000);
    // Started := True;
//    TModelUtilLogger.New
//      .WriteLog('Service Start' + sLineBreak +
//                'Modulo: ' + 'G2Server.exe' + sLineBreak +
//                //'Versão: ' + ModelParam.DescricaoVersaoAplicativo + ' ' + ModelParam.ServicePack + sLineBreak +
//                'Versão: ' + TModelVersionInfo.GetInstance.DescricaoVersaoAplicativo + ' ' + TModelVersionInfo.GetInstance.ServicePack + sLineBreak +
//                'Porta: ' + THorse.Port.ToString)
//      .WriteLogLine;
  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Service Start' + sLineBreak +
//                  'Mensagem: ' + E.Message + sLineBreak +
//                  'Unit: ' + 'MainService')
//        .WriteLogLine;
    end;
  end;
end;


procedure TViewAplicacao.AposServiceStart;
begin
  try

  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Service Stop' + sLineBreak + 'Mensagem: ' + E.Message +
//                                   sLineBreak + 'Unit: ' + 'MainService')
//        .WriteLogLine;
    end;
  end;
end;

procedure TViewAplicacao.ApplicationEvents1Minimize(Sender: TObject);
begin
  Self.Hide();
  Self.WindowState := wsMinimized;
  TrayIcon1.Visible := True;
  TrayIcon1.Animate := True;
  TrayIcon1.ShowBalloonHint;
end;

procedure TViewAplicacao.ConfiguraControles;
begin
  BorderStyle := bsDialog;
  Position := poScreenCenter;
  // WindowState := wsMinimized;
end;

procedure TViewAplicacao.fechar1Click(Sender: TObject);
begin
  Vcl.Forms.Application.Terminate;
end;
end.


