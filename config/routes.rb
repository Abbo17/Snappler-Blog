Rails.application.routes.draw do

  namespace :admin do
    resource :base, only: :index
    resources :products do
    end
    resources :categories, only: [:index, :create,:destroy]
    resources :tags , only: [:index, :create,:destroy]do
    end
    resources :sliders
    resources :users, only: [:index, :new]
    root to: 'base#index'
  end
  
  resources :welcomes
  devise_for :users, path: 'admin' #, only:[:sessions]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'
end
