# == Route Map
#
#                         Prefix Verb       URI Pattern                                                                              Controller#Action
#               new_user_session GET        /users/sign_in(.:format)                                                                 devise/sessions#new
#                   user_session POST       /users/sign_in(.:format)                                                                 devise/sessions#create
#           destroy_user_session DELETE     /users/sign_out(.:format)                                                                devise/sessions#destroy
#              new_user_password GET        /users/password/new(.:format)                                                            devise/passwords#new
#             edit_user_password GET        /users/password/edit(.:format)                                                           devise/passwords#edit
#                  user_password PATCH      /users/password(.:format)                                                                devise/passwords#update
#                                PUT        /users/password(.:format)                                                                devise/passwords#update
#                                POST       /users/password(.:format)                                                                devise/passwords#create
#       cancel_user_registration GET        /users/cancel(.:format)                                                                  devise/registrations#cancel
#          new_user_registration GET        /users/sign_up(.:format)                                                                 devise/registrations#new
#         edit_user_registration GET        /users/edit(.:format)                                                                    devise/registrations#edit
#              user_registration PATCH      /users(.:format)                                                                         devise/registrations#update
#                                PUT        /users(.:format)                                                                         devise/registrations#update
#                                DELETE     /users(.:format)                                                                         devise/registrations#destroy
#                                POST       /users(.:format)                                                                         devise/registrations#create
#          new_user_confirmation GET        /users/confirmation/new(.:format)                                                        devise/confirmations#new
#              user_confirmation GET        /users/confirmation(.:format)                                                            devise/confirmations#show
#                                POST       /users/confirmation(.:format)                                                            devise/confirmations#create
#         new_admin_user_session GET        /admin/login(.:format)                                                                   active_admin/devise/sessions#new
#             admin_user_session POST       /admin/login(.:format)                                                                   active_admin/devise/sessions#create
#     destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                                                  active_admin/devise/sessions#destroy
#        new_admin_user_password GET        /admin/password/new(.:format)                                                            active_admin/devise/passwords#new
#       edit_admin_user_password GET        /admin/password/edit(.:format)                                                           active_admin/devise/passwords#edit
#            admin_user_password PATCH      /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                PUT        /admin/password(.:format)                                                                active_admin/devise/passwords#update
#                                POST       /admin/password(.:format)                                                                active_admin/devise/passwords#create
#                     admin_root GET        /admin(.:format)                                                                         admin/dashboard#index
# batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                                                admin/admin_users#batch_action
#              admin_admin_users GET        /admin/admin_users(.:format)                                                             admin/admin_users#index
#                                POST       /admin/admin_users(.:format)                                                             admin/admin_users#create
#           new_admin_admin_user GET        /admin/admin_users/new(.:format)                                                         admin/admin_users#new
#          edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                                                    admin/admin_users#edit
#               admin_admin_user GET        /admin/admin_users/:id(.:format)                                                         admin/admin_users#show
#                                PATCH      /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                PUT        /admin/admin_users/:id(.:format)                                                         admin/admin_users#update
#                                DELETE     /admin/admin_users/:id(.:format)                                                         admin/admin_users#destroy
#                admin_dashboard GET        /admin/dashboard(.:format)                                                               admin/dashboard#index
#                 admin_comments GET        /admin/comments(.:format)                                                                admin/comments#index
#                                POST       /admin/comments(.:format)                                                                admin/comments#create
#                  admin_comment GET        /admin/comments/:id(.:format)                                                            admin/comments#show
#                                DELETE     /admin/comments/:id(.:format)                                                            admin/comments#destroy
#                           root GET        /                                                                                        homes#index
#             rails_service_blob GET        /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#      rails_blob_representation GET        /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#             rails_disk_service GET        /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#      update_rails_disk_service PUT        /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#           rails_direct_uploads POST       /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  #devise user
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  #active admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  #home page
  root 'homes#index'

  # get 'homes/page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
