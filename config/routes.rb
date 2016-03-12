AuroFe::Application.routes.draw do
  devise_for :users, :controllers => { 
    :omniauth_callbacks => "omniauth"
  }
  
  root to: 'home#index'

  resources :users do
  	get 'update_last_location'
  end

  resources :outlets, only: [:index, :show]

 end
