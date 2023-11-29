unit Backend.Controller.Usuario;

interface

uses
  Horse,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerUsuario = class
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
  Backend.Dao.Usuario,
  Backend.Model.Usuario;

{ TControllerUsuario }

constructor TControllerUsuario.Create;
begin

end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelUsuario: TModelUsuario;
  DaoUsuario: TDaoUsuario;
begin
  ModelUsuario := TModelUsuario.Create;
  DaoUsuario := TDaoUsuario.Create(nil);
  try
    DaoUsuario.Cadastrar(Req,Res,Next);
  finally
    ModelUsuario.Free;
    DaoUsuario.Free;
  end;
end;

procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelUsuario: TModelUsuario;
  DaoUsuario: TDaoUsuario;
begin
  ModelUsuario := TModelUsuario.Create;
  DaoUsuario := TDaoUsuario.Create(nil);
  try
    DaoUsuario.Alterar(Req,Res,Next);
  finally
    ModelUsuario.Free;
    DaoUsuario.Free;
  end;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoUsuario: TDaoUsuario;
  ModelUsuario: TModelUsuario;
  ListaFabricante: TList<TModelUsuario>;
begin
  DaoUsuario := TDaoUsuario.Create(nil);
  ListaFabricante := TList<TModelUsuario>.Create;
  try
    try
      DaoUsuario.Listar(Req,ListaFabricante);
      Res.Send(ModelUsuario.GetJSON(ListaFabricante)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoUsuario.Free;
    // ModelUsuario.Free;
    ListaFabricante.Free;
  end;
end;

procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelUsuario: TModelUsuario;
  DaoUsuario: TDaoUsuario;
begin
  ModelUsuario := TModelUsuario.Create;
  DaoUsuario := TDaoUsuario.Create(nil);
  try
    DaoUsuario.Deletar(Req,Res,Next);
  finally
    ModelUsuario.Free;
    DaoUsuario.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/usuarios',Listar);
  THorse.Post('/usuarios',Cadastrar);
  THorse.Put('/usuarios',Alterar);
  THorse.Delete('/usuarios',Deletar);
end;

initialization
  Registry;

end.
