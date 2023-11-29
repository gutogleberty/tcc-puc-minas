unit Frontend.View.Perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, Data.DB;

type
  TViewPerfil = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnExcluir: TIWButton;
    BtnAlterar: TIWButton;
    BtnCadastrar: TIWButton;
    BtnListar: TIWButton;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPerfil: TViewPerfil;

implementation

uses
  Frontend.View.MenuPrincipal;

{$R *.dfm}

procedure TViewPerfil.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewMenuPrincipal.Create(WebApplication).Show;
end;

end.
