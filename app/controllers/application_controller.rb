# require 'csv'
class ApplicationController < ActionController::Base
   before_action :authenticate_user!
  # before_action :set_current_account
  
  # before_action :configure_permitted_parameters, if: :devise_controller?
    
  # protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.permit(:sign_up, keys: [:age, :gender, :phone_no, :image_cache, :address])
  #   end

  # # def set_current_account
  # #   if session[:account_id]
  # #     Current.account = Account.find_by(id: session[:account_id])
  # #   end
  # # end

  # def new_session_path(scope)
  #   new_user_session_path
  # end

  # def require_account_logged_in
  #   redirect_to sign_in_path, alert: "need to sign in first" if Current.account.nil? 
  # end
end