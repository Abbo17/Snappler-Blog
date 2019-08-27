class AdminController < ApplicationController
    add_breadcrumb "Inicio ", :admin_root_path
    layout 'admin/application'
end