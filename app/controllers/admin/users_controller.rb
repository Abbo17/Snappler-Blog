class Admin::UsersController < AdminController
    add_breadcrumb "Usuarios ", :admin_users_path
    before_action :authenticate_user!
    def index
        @users = User.page(params[:page])
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
            if (@cantUserName != 0)
                @error = "El nombre de usuario ya esta en uso"
            else
                @error = "El email ya esta en uso"
            end
            render :new
        end
    end

    def destroy
        @user=User.find(params[:id])
        
        if (@user.id != current_user.id)
            @user.destroy
            redirect_to admin_users_path
        else
            @error = "Ese es tu usuario!"
            @users = User.page(params[:page])
            render :index
        end
        
  
    end

    def show
        add_breadcrumb "Ver Usuario ", :admin_user_path
        @user=User.find(params[:id])
    end

    def update
    
        @user = User.find(params[:id])
        @cantUserEmail = 0
        @cantUserName = 0

        if (params[:user][:username] != @user.username)
            @cantUserName = User.where(username: @user.username).count
        end
        if (params[:user][:email] != @user.email)
            @cantUserEmail = User.where(email: @user.email).count
        end
        
        if (@cantUserName == 0 && @cantUserEmail == 0)
            @user.update(username: params[:user][:username], 
                        email: params[:user][:email], 
                        password: params[:user][:password],
                        password_confirmation: params[:user][:password_confirmation]
                        )
            
            redirect_to admin_users_path
        else
            if (@cantUserName != 0)
                @error = "El nombre de usuario ya esta en uso"
            else
                @error = "El email ya esta en uso"
            end
            render :show
        end

    end
end
