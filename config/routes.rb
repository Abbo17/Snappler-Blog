Rails.application.routes.draw do

  namespace :admin do
    resource :base, only: :index
    
    devise_for :user, controllers: { 
      registrations: 'admin/user/registrations',
      sessions: 'admin/user/sessions'
    }
    resources :products do
    end
    root to: 'products#index'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
