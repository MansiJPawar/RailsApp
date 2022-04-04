class  Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create, :edit]

  def create 
    super
  end

  def edit 
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_no, :age, :gender, :address, :email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_no, :age, :gender, :address, :email])   
  end
end