class Admin::UsersController < AdminController
    before_action :authenticate_user!
    def index
        @user = User.all
	end
end
