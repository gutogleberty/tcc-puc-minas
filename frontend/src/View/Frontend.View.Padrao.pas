unit Frontend.View.Padrao;

interface

uses
  Classes,
  SysUtils,
  IWAppForm,
  IWApplication,
  IWColor,
  IWTypes,
  IWVCLComponent,
  IWBaseLayoutComponent,
  IWBaseContainerLayout,
  IWContainerLayout,
  IWTemplateProcessorHTML,
  Data.DB;

type
  TStatus = (stInclusao, stAlteracao);

type
  TViewPadrao = class(TIWAppForm)
    TPS: TIWTemplateProcessorHTML;
    DataSource1: TDataSource;
    procedure IWAppFormCreate(Sender: TObject);
    procedure TPSUnknownTag(const AName: string; var VValue: string);
  public
    Status: TStatus;
    PrimaryKey: Integer;
    procedure ConfiguraControles;
  end;

implementation

{$R *.dfm}

uses
  Template.StartAdmin;


{ TViewPadrao }

procedure TViewPadrao.ConfiguraControles;
begin
  LayoutMgr := TPS;
  TPS.MasterFormTag := False;
  TPS.RenderStyles := False;
end;

procedure TViewPadrao.IWAppFormCreate(Sender: TObject);
begin    {
  if Self.Name = 'ViewLogin' then
  begin
    TPS.MasterTemplate := '';
    TPS.Templates.Default := 'app/' + Self.Name + '.html';
  end
  else
  begin
    TPS.MasterTemplate := 'app/master.html';
    TPS.Templates.Default := 'app/' + Self.Name + '.html';
  end;   }
  ConfiguraControles;
end;

procedure TViewPadrao.TPSUnknownTag(const AName: string; var VValue: string);
begin  {
  if AName = 'head' then
    if Self.Name = 'ViewLogin' then
      VValue := Get_Head_Login;

  if AName = 'footer' then
    if Self.Name = 'ViewLogin' then
      VValue := Get_Footer_Login;

  if AName = 'Title' then
    VValue := Self.Title;     }
end;

end.
