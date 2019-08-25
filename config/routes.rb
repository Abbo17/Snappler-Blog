Rails.application.routes.draw do

  namespace :admin do
    resource :base, only: :index
    resources :products do
    end
    root to: 'products#index'
  end
  
  devise_for :users, path: 'admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
