unit Backend.Controller.Perfil;

interface

uses
  Horse,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerPerfil = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

  procedure ListarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure CadastrarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure AtualizarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  Backend.Dao.Perfil,
  Backend.Model.Perfil;

{ TControllerPerfil }

constructor TControllerPerfil.Create;
begin

end;

destructor TControllerPerfil.Destroy;
begin

  inherited;
end;

procedure CadastrarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelPerfil: TModelPerfil;
  DaoPerfil: TDaoPerfil;
begin
  ModelPerfil := TModelPerfil.Create;
  DaoPerfil := TDaoPerfil.Create(nil);
  try
    DaoPerfil.CadastrarPerfil(Req,Res,Next);
  finally
    ModelPerfil.Free;
    DaoPerfil.Free;
  end;
end;

procedure AtualizarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelPerfil: TModelPerfil;
  DaoPerfil: TDaoPerfil;
begin
  ModelPerfil := TModelPerfil.Create;
  DaoPerfil := TDaoPerfil.Create(nil);
  try
    DaoPerfil.AtualizarPerfil(Req,Res,Next);
  finally
    ModelPerfil.Free;
    DaoPerfil.Free;
  end;
end;

procedure ListarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoPerfil: TDaoPerfil;
  ModelPerfil: TModelPerfil;
  ListaPerfil: TList<TModelPerfil>;
begin
  DaoPerfil := TDaoPerfil.Create(nil);
  ListaPerfil := TList<TModelPerfil>.Create;
  try
    try
      DaoPerfil.ListarPerfil(Req,ListaPerfil);
      Res.Send(ModelPerfil.GetJSON(ListaPerfil)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoPerfil.Free;
    // ModelPerfil.Free;
    ListaPerfil.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/perfil',ListarPerfil);
  THorse.Post('/perfil',CadastrarPerfil);
  THorse.Put('/perfil',AtualizarPerfil);
end;

initialization
  Registry;

end.
