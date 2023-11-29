unit Template.StartAdmin;

interface

  const PathTheme = 'app/';

  function Get_Head_Login: string;
  function Get_Footer_Login: string;

implementation

function Get_Head_Login: string;
begin
  Result :=
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/feather/feather.css">' +
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/mdi/css/materialdesignicons.min.css">' +
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/ti-icons/css/themify-icons.css">' +
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/typicons/typicons.css">' +
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/simple-line-icons/css/simple-line-icons.css">' +
  '<link rel="stylesheet" href="' + PathTheme + 'vendors/css/vendor.bundle.base.css">';
end;

function Get_Footer_Login: string;
begin
  Result :=
  '<script src="' + PathTheme + 'js/off-canvas.js"></script>' +
  '<script src="' + PathTheme + 'js/hoverable-collapse.js"></script>' +
  '<script src="' + PathTheme + 'js/template.js"></script>' +
  '<script src="' + PathTheme + 'js/settings.js"></script>' +
  '<script src="' + PathTheme + 'js/todolist.js"></script>';
end;

end.

 '<link rel="stylesheet" href="'+PathTheme+../../vendors/css/vendor.bundle.base.css">
