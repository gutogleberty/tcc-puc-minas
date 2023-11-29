unit Backend.Dao.ConexaoPadrao;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  System.IniFiles,
  Vcl.Forms,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TDaoConexaoPadrao = class(TDataModule)
    FDConexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetConfiguracoesConexao;
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDaoConexaoPadrao.DataModuleCreate(Sender: TObject);
begin
  SetConfiguracoesConexao;
end;

procedure TDaoConexaoPadrao.SetConfiguracoesConexao;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) +'configuracoes.ini');

  try
    FDConexao.Connected := False;

    FDConexao.Params.Clear;

    FDConexao.Params.Values['DriverID'] := 'FB';

    FDConexao.Params.Values['User_Name'] := IniFile.ReadString('Db','UserName','SYSDBA');

    FDConexao.Params.Values['Password'] := IniFile.ReadString('Db','Password','masterkey');

    FDConexao.FetchOptions.AssignedValues    := [evMode, evRowsetSize];

    FDConexao.FetchOptions.Mode              := fmAll;

    FDConexao.ResourceOptions.AssignedValues := [rvAutoReconnect];

    FDConexao.ResourceOptions.AutoReconnect  := True;

    FDConexao.FetchOptions.RowsetSize        := 100000;

    FDConexao.Params.Values['Database']      := IniFile.ReadString('Db','Path','');

    FDConexao.Connected := True;

    FreeAndNil(IniFile);
  except
    on E: Exception do
    begin
//      TModelUtilLogger.New
//        .WriteLog('Erro ao conectar com o banco de dados' + sLineBreak +
//                                 'Mensagem: ' + E.Message + sLineBreak +
//                                 'Unit: ' + 'Server.Model.DmConexao')
//        .WriteLogLine;
      // ModelInformacoesServidorAplicacao.CodigoMensagem := 1;
      // ModelInformacoesServidorAplicacao.Mensagem.Add('Erro ao conectar com o banco de dados local');
      // ModelInformacoesServidorAplicacao.FatalError := True;
    end;
  end;
end;
end.
