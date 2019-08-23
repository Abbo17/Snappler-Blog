Rails.application.routes.draw do

  devise_for :users, skip: [:registrations]
    as :user do
      get "/login" => "devise/sessions#new" # custom path to login/sign_in
      get "/register" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
      get 'perfil' => 'devise/registrations#edit', :as => 'edit_user_registration'
      put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
