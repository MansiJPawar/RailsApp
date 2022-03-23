Rails.application.routes.draw do
  devise_for :accounts

  #dashboard
  get "/dashboard" => "accounts#index"
  
  #profile url
  get "profile/:username" => "accounts#profile", as: :profile #add name to profile for navigation
  #used when like generated on ajax call
  get "post/like/:post_id" => "likes#save_like", as: :like_post 
  #follow account
  post "follow/account" => "accounts#follow_account", as: :follow_account

  resources :posts, only: [:new,:create,:show]
  #comments
  resources :comments, only: [:create]

  #route defined as 'controllername#methodname'
  root to: "public#homepage"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
