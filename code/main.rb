require_relative 'init_app'
require_relative 'menu'

$init_app = InitApp.new
$init_app.open_app

$menu = Menu.new
$menu.main_menu