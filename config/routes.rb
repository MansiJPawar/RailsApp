Rails.application.routes.draw do
  devise_for :accounts

  #dashboard
  get "/dashboard" => "accounts#index"
  
  
  resources :posts, only: [:new,:create,:show]

  #route defined as 'controllername#methodname'
  root to: "public#homepage"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
