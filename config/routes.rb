Rails.application.routes.draw do
  devise_for :accounts

  #dashboard
  get "/dashboard" => "accounts#index"
  
  #profile url
  get "profile/:username" => "accounts#profile", as: :profile #add name to profile for navigation

  resources :posts, only: [:new,:create,:show]

  #route defined as 'controllername#methodname'
  root to: "public#homepage"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
