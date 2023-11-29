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

  procedure ListarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure CadastrarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure AtualizarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);

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

procedure CadastrarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelFabricante: TModelFabricante;
  DaoFabricante: TDaoFabricante;
begin
  ModelFabricante := TModelFabricante.Create;
  DaoFabricante := TDaoFabricante.Create(nil);
  try
    DaoFabricante.CadastrarFabricante(Req,Res,Next);
  finally
    ModelFabricante.Free;
    DaoFabricante.Free;
  end;
end;

procedure AtualizarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelFabricante: TModelFabricante;
  DaoFabricante: TDaoFabricante;
begin
  ModelFabricante := TModelFabricante.Create;
  DaoFabricante := TDaoFabricante.Create(nil);
  try
    DaoFabricante.AtualizarFabricante(Req,Res,Next);
  finally
    ModelFabricante.Free;
    DaoFabricante.Free;
  end;
end;

procedure ListarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoFabricante: TDaoFabricante;
  ModelFabricante: TModelFabricante;
  ListaFabricante: TList<TModelFabricante>;
begin
  DaoFabricante := TDaoFabricante.Create(nil);
  ListaFabricante := TList<TModelFabricante>.Create;
  try
    try
      DaoFabricante.ListarFabricante(Req,ListaFabricante);
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

procedure Registry;
begin
  THorse.Get('/fabricantes',ListarFabricante);
  THorse.Post('/fabricantes',CadastrarFabricante);
  THorse.Put('/fabricantes',AtualizarFabricante);
end;

initialization
  Registry;

end.
