Rails.application.routes.draw do
  
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 
  #home page
  root 'home#index'

  # root 'profiles#index'
  get 'shared/admin'

  get 'profiles/index'

  #custom registraion form
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"
  
  delete "logout", to: "sessions#destroy"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "password", to: "passwords#edit", as: :edit_password
  post "password", to: "passwords#update"

  # devise_scope :user do
  #   delete 'disconnect', to: 'devise/sessions#destroy'
  # end

 
  
  # root to: "main#index"

  # get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
  # delete 'disconnect', to: '/auth/facebook#destroy'
  # resources :facebook_account
  
  # get "facebook_accounts/:id"
  # delete "facebook_accounts/:id"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
