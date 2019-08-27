class Admin::ProductsController < AdminController
    add_breadcrumb "Productos ", :admin_products_path
    before_action :authenticate_user!
end
