unit Backend.Controller.Fabricante;

interface

uses
  Horse,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerFabricante = class
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
  Backend.Dao.Fabricante,
  Backend.Model.Fabricante;

{ TControllerFabricante }

constructor TControllerFabricante.Create;
begin

end;

destructor TControllerFabricante.Destroy;
begin

  inherited;
end;

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelFabricante: TModelFabricante;
  DaoFabricante: TDaoFabricante;
begin
  ModelFabricante := TModelFabricante.Create;
  DaoFabricante := TDaoFabricante.Create(nil);
  try
    DaoFabricante.Cadastrar(Req,Res,Next);
  finally
    ModelFabricante.Free;
    DaoFabricante.Free;
  end;
end;

procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelFabricante: TModelFabricante;
  DaoFabricante: TDaoFabricante;
begin
  ModelFabricante := TModelFabricante.Create;
  DaoFabricante := TDaoFabricante.Create(nil);
  try
    DaoFabricante.Alterar(Req,Res,Next);
  finally
    ModelFabricante.Free;
    DaoFabricante.Free;
  end;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoFabricante: TDaoFabricante;
  ModelFabricante: TModelFabricante;
  ListaFabricante: TList<TModelFabricante>;
begin
  DaoFabricante := TDaoFabricante.Create(nil);
  ListaFabricante := TList<TModelFabricante>.Create;
  try
    try
      DaoFabricante.Listar(Req,ListaFabricante);
      Res.Send(ModelFabricante.GetJSON(ListaFabricante)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoFabricante.Free;
    // ModelFabricante.Free;
    ListaFabricante.Free;
  end;
end;

procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelFabricante: TModelFabricante;
  DaoFabricante: TDaoFabricante;
begin
  ModelFabricante := TModelFabricante.Create;
  DaoFabricante := TDaoFabricante.Create(nil);
  try
    DaoFabricante.Deletar(Req,Res,Next);
  finally
    ModelFabricante.Free;
    DaoFabricante.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/fabricantes',Listar);
  THorse.Post('/fabricantes',Cadastrar);
  THorse.Put('/fabricantes',Alterar);
  THorse.Delete('/fabricantes',Deletar);
end;

initialization
  Registry;

end.
