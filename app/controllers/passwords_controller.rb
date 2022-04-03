class PasswordsController < ApplicationController
  before_action :require_account_logged_in 

  def edit
  end 
  
  def update
    if Current.account.update(password_params)
      redirect_to root_path, notice: "password updated"
    else 
      render :edit
    end
  end

  private 

  def password_params
    params.require(:account).permit(:password, :password_confirmation)
  end
end
