unit MainService;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.SvcMgr,
  Vcl.Dialogs,
  Horse,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.Compression,
  Horse.GBSwagger,
  Horse.BasicAuthentication,
  Horse.CORS,
  Vcl.ExtCtrls,
  System.Hash,
  Data.DB,
  IdHashMessageDigest,
  System.IniFiles,
  Vcl.Forms,
  System.JSON,
  REST.Types;

type
  TService1 = class(TService)
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
  private
    { Private declarations }
    procedure AposServiceStart;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  Service1: TService1;

implementation

{$R *.dfm}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  Service1.Controller(CtrlCode);
end;

procedure TService1.AposServiceStart;
begin

end;

function TService1.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TService1.ServiceCreate(Sender: TObject);
begin
  try
    THorse
      .USe(Compression())
      .Use(Jhonson())
      .Use(HandleException)
      .Use(HorseSwagger)
      .Use(CORS)
      .Use(HorseBasicAuthentication(
      function(const AUsername, APassword: string): Boolean
      begin
        Result := AUsername.Equals('pucminasuser') and APassword.Equals('pucminaspassword');
      end));

  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Service Create' + sLineBreak +
//                  'Mensagem: ' + E.Message + sLineBreak +
//                  'Unit: ' + 'MainService')
//        .WriteLogLine;
    end;
  end;
end;

procedure TService1.ServiceExecute(Sender: TService);
begin
  AposServiceStart;
  while not Terminated do
    ServiceThread.ProcessRequests(True);
end;

procedure TService1.ServiceStart(Sender: TService; var Started: Boolean);
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +'G2Server.ini');
  try
    THorse.Listen(IniFile.ReadInteger('Servico','Porta',9000));
    Started := True;
//    TModelUtilLogger.New
//      .WriteLog('Service Start' + sLineBreak +
//                'Modulo: ' + 'G2Server.exe' + sLineBreak +
//                'Versão: ' + TModelVersionInfo.GetInstance.DescricaoVersaoAplicativo + ' ' + TModelVersionInfo.GetInstance.ServicePack + sLineBreak +
//                'Porta: ' + THorse.Port.ToString)
//      .WriteLogLine;

    // WriteLog('Porta ' + THorse.Port.ToString);
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
  FreeAndNil(IniFile);
end;

procedure TService1.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  try
    THorse.StopListen;
    Stopped := True;
//    TModelUtilLogger.New
//      .WriteLog('Service Stop')
//      .WriteLogLine;
  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Service Stop' + sLineBreak +
//                  'Mensagem: ' + E.Message + sLineBreak +
//                  'Unit: ' + 'MainService')
//        .WriteLogLine;
    end;
  end;
end;

end.
