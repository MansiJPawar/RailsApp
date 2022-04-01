require 'csv'
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
    
  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:age, :gender, :phone_no, :image_cache, :address, :email, :password, :password_confirmation])
    end
end
