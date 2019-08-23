Rails.application.routes.draw do

  namespace :admin do
    devise_for :user, controllers: { 
      registrations: 'admin/user/registrations',
      sessions: 'admin/user/sessions'
    }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
