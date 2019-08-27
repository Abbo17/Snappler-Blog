Rails.application.routes.draw do

  namespace :admin do
    resource :base, only: :index
    resources :products do
    end
    resources :categories do
    end
    resources :tags do
    end
    resources :users, only: [:index, :new]
    root to: 'users#index'
  end
  
  devise_for :users, path: 'admin' #, only:[:sessions]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
