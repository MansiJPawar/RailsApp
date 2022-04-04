class RegistrationsController < ApplicationController
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
  # #to create new account 
  # def new 
  #   #instance var to be visible in views
  #   @account = Account.new
  # end 

  # def create
  #   @account =  Account.new(account_params)
  #   if @account.save!
  #     #session cookies encrypted store 
  #     session[:account_id] = @account.id
  #     redirect_to root_path, notice: "Account created"
  #   else
  #     render :new 
  #   end 
  # end

  # private

  # def account_params 
  #   params.require(:account).permit(:email, :password, :password_confirmation)
  # end

end