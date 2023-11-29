unit Frontend.View.Secao;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  IWCompEdit,
  Vcl.Controls,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompButton,
  IWCompLabel,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML,
  Frontend.View.Padrao,
  IWHTMLTag;

type
  TViewSecao = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    procedure IWAppFormCreate(Sender: TObject);
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
  public
    procedure ConfiguraControles;
  end;

implementation

uses
  Frontend.View.MenuPrincipal;

{$R *.dfm}


procedure TViewSecao.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

procedure TViewSecao.ConfiguraControles;
begin

end;

procedure TViewSecao.IWAppFormCreate(Sender: TObject);
begin
  ConfiguraControles;
end;

end.
