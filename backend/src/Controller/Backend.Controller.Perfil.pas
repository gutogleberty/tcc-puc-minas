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

  procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);

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

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelPerfil: TModelPerfil;
  DaoPerfil: TDaoPerfil;
begin
  ModelPerfil := TModelPerfil.Create;
  DaoPerfil := TDaoPerfil.Create(nil);
  try
    DaoPerfil.Cadastrar(Req,Res,Next);
  finally
    ModelPerfil.Free;
    DaoPerfil.Free;
  end;
end;

procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelPerfil: TModelPerfil;
  DaoPerfil: TDaoPerfil;
begin
  ModelPerfil := TModelPerfil.Create;
  DaoPerfil := TDaoPerfil.Create(nil);
  try
    DaoPerfil.Alterar(Req,Res,Next);
  finally
    ModelPerfil.Free;
    DaoPerfil.Free;
  end;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoPerfil: TDaoPerfil;
  ModelPerfil: TModelPerfil;
  ListaPerfil: TList<TModelPerfil>;
begin
  DaoPerfil := TDaoPerfil.Create(nil);
  ListaPerfil := TList<TModelPerfil>.Create;
  try
    try
      DaoPerfil.Listar(Req,ListaPerfil);
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

procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelPerfil: TModelPerfil;
  DaoPerfil: TDaoPerfil;
begin
  ModelPerfil := TModelPerfil.Create;
  DaoPerfil := TDaoPerfil.Create(nil);
  try
    DaoPerfil.Deletar(Req,Res,Next);
  finally
    ModelPerfil.Free;
    DaoPerfil.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/perfil',Listar);
  THorse.Post('/perfil',Cadastrar);
  THorse.Put('/perfil',Alterar);
  THorse.Delete('/perfil',Deletar);
end;

initialization
  Registry;

end.
