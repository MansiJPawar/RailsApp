class  Users::RegistrationsController < Devise::RegistrationsController
  before_action :configuration_sign_up_params, only: [:create]
  before_action :configuration_account_update_params, only: [:update]

  def create 
    super
  end

  def edit 
    super
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:age, :gender, :phone_no, :image, :address, :name])
      # devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys:  [:age, :gender, :phone_no, :image_cache, :address])
  end

end