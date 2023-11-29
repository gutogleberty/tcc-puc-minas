unit Frontend.View.Login;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Frontend.View.Padrao,
  IWCompLabel,
  IWCompEdit,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompButton,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWHTMLTag,
  IWContainerLayout,
  IWTemplateProcessorHTML;

type
  TViewLogin = class(TViewPadrao)
    BtnOK: TIWButton;
    EdtUsuario: TIWEdit;
    EdtSenha: TIWEdit;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure EdtUsuarioHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure EdtSenhaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
    procedure BtnOKAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ConfiguraControles;
  end;

var
  ViewLogin: TViewLogin;

implementation

uses
  Frontend.View.MenuPrincipal;

{$R *.dfm}

{ TViewLogin }

procedure TViewLogin.BtnOKAsyncClick(Sender: TObject; EventParams: TStringList);
begin
  inherited;
  if Trim(EdtUsuario.Text) = '' then
  begin
    WebApplication.ShowMessage('Usuário inválido');
    Exit;
  end;

  if Trim(EdtSenha.Text) = '' then
  begin
    WebApplication.ShowMessage('Senha inválida');
    Exit;
  end;

  TViewMenuPrincipal.Create(WebApplication).Show;
end;

procedure TViewLogin.ConfiguraControles;
begin
   Title := 'Login';
   EdtUsuario.Css := 'form-control';
   EdtSenha.Css := 'form-control';
   EdtSenha.DataType := stPassword;
end;

procedure TViewLogin.EdtSenhaHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  ATag.Add('placeholder="*******"');
end;

procedure TViewLogin.EdtUsuarioHTMLTag(ASender: TObject; ATag: TIWHTMLTag);
begin
  inherited;
  ATag.Add('placeholder="Informe o nome de usuário"');
end;

procedure TViewLogin.IWAppFormCreate(Sender: TObject);
begin
  inherited;
  ConfiguraControles;
end;

initialization
  TViewLogin.SetAsMainForm;

end.

// continuar
// https://youtu.be/_KE_kpuqxV0?list=PLe3pgSSTNw4PD9GWnCcqWKMR3Ujb1rXMc&t=735
