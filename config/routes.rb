Rails.application.routes.draw do

  #in routes
  devise_for :users,:controllers => { 
    registrations: "users/registrations",
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    delete 'log_out', :to => 'devise/sessions#destroy'
  end

  #home page
  root 'home#index'
  # root 'profiles#index'
  get 'shared/admin'
  post 'shared/admin'

  # resources :shared
  get 'profiles/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
