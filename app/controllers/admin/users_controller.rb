class Admin::UsersController < AdminController
    add_breadcrumb "Usuarios ", :admin_users_path
    before_action :authenticate_user!
    def index
        @users = User.all
    end
    
    def new
        add_breadcrumb "Nuevo Usuario ", :new_admin_user_path
        @user = User.new
    end

    def create
        @user = User.new(
            params.require(:user)
            .permit(:email,:username,:password,:password_confirmation))
        @cantUserName = User.where(username: @user.username).count
        @cantUserEmail = User.where(email: @user.email).count
        
        if (@cantUserName == 0 && @cantUserEmail == 0)
            if @user.save
                  redirect_to admin_users_path
            else
                  redirect_to admin_users_path
            end
        else 
            redirect_to admin_users_path
        end
    end

    def destroy
        @user=User.find(params[:id])
        
        if (@user.id != current_user.id)
            @user.destroy
            redirect_to admin_users_path
        else
            redirect_to admin_users_path
        end
        
  
    end

    def show
        add_breadcrumb "Ver Usuario ", :admin_user_path
        @user=User.find(params[:id])
    end

    def update
    
        @user = User.find(params[:id])
        
        @cantUserName = User.where(username: params[:user][:username]).count
        @cantUserEmail = User.where(email: params[:user][:email]).count
        
        if (@cantUserName == 0 && @cantUserEmail == 0)
            @user.update(username: params[:user][:username], 
                        email: params[:user][:email], 
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation]
                        )
            
            redirect_to admin_users_path
        else
            redirect_to admin_users_path
        end

    end
end
