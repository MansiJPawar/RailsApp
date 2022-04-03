class RegistrationsController < ApplicationController
  #to create new account 
  def new 
    #instance var to be visible in views
    @account = Account.new
  end 

  def create
    @account =  Account.new(account_params)
    if @account.save!
      #session cookies encrypted store 
      session[:account_id] = @account.id
      redirect_to root_path, notice: "Account created"
    else
      render :new 
    end 
  end

  private

  def account_params 
    params.require(:account).permit(:email, :password, :password_confirmation)
  end

end