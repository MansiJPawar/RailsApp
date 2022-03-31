Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 
  #home page
  root 'home#index'

  # root 'profiles#index'

  get 'profiles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
