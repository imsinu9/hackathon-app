AuroFe::Application.routes.draw do
  devise_for :users, :controllers => { 
    :omniauth_callbacks => "omniauth"
  }
  
  root to: 'users#index'

 end
