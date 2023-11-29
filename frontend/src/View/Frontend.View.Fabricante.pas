unit Frontend.View.Fabricante;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  Frontend.View.Padrao, Vcl.Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton;

type
  TViewFabricante = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
  public
    procedure ConfiguraControles;
  end;

implementation

uses
  Frontend.View.MenuPrincipal;

{$R *.dfm}


{ TViewFabricante }

procedure TViewFabricante.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

procedure TViewFabricante.ConfiguraControles;
begin

end;

end.
