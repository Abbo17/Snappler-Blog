Rails.application.routes.draw do

  namespace :admin do
    resource :base, only: :index
    resources :products do 
      get :showImages, on: :member
      get :selectImages, on: :member
    end
    resources :categories
    resources :tags 
    resources :sliders
    resources :users
    resources :logos
    root to: 'base#index'
  end
  
  namespace :fronted do
    resources :home
    resources :catalogo
  end
  devise_for :users, path: 'admin' , only:[:sessions]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'fronted/home#index'
end
