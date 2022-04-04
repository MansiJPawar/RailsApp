Rails.application.routes.draw do
  
  # devise_for :users, :controllers omniauth_callbacks: "users/omniauth_callbacks"{ registrations: "users/registrations" } 
 
  devise_scope :user do
    delete 'log_out', :to => 'devise/sessions#destroy'
  end

  #####in routes
  devise_for :users,:controllers => { 
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # #####in routes
  # devise_for :users,:controllers => { 
  #   :sessions => "users/sessions", 
  #   :registrations =>  "users/registrations", 
  #   :passwords =>  "users/passwords",
  #   :confirmations =>  "users/confirmations",
  #   omniauth_callbacks: 'users/omniauth_callbacks'
  # }

  #home page
  root 'home#index'

  # root 'profiles#index'
  get 'shared/admin'

  get 'profiles/index'

  # resources :shared do
  #   member do
  #       patch :toggle_enable_status
  #   end
  # end


  # get 'user/:id/toggle-active' => 'user#toggle_active'


  # get "Update", to: "devise/sessions#create"
  # post "Update", to: "devise/sessions#create"

  # #custom registraion form
  # get "sign_up", to: "registrations#new"
  # post "sign_up", to: "registrations#create"
  
  # delete "logout", to: "sessions#destroy"

  # get "sign_in", to: "sessions#new"
  # post "sign_in", to: "sessions#create"

  # get "password", to: "passwords#edit", as: :edit_password
  # post "password", to: "passwords#update"


  # root to: "main#index"

  # get "/auth/facebook/callback", to: "omniauth_callbacks#facebook"
  # delete 'disconnect', to: '/auth/facebook#destroy'
  # resources :facebook_account
  
  # get "facebook_accounts/:id"
  # delete "facebook_accounts/:id"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
