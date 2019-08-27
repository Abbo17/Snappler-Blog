class ApplicationController < ActionController::Base

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username,:email, :password) }
        devise_parameter_sanitizer.for(:account_update) { |u|    u.permit(:username,:email, :password) }
    end
end
