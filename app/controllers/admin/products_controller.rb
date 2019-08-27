class Admin::ProductsController < AdminController
    before_action :authenticate_user!
end
