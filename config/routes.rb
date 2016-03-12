AuroFe::Application.routes.draw do
  devise_for :users, :controllers => { 
    :omniauth_callbacks => "omniauth"
  }
  
  root to: 'home#index'

  resource :users do
  	get 'update_last_location'
  end

 end
