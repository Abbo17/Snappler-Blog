class Admin::UsersController < AdminController
    add_breadcrumb "Usuarios ", :admin_users_path
    before_action :authenticate_user!
    def index
        @users = User.all
	end
end
