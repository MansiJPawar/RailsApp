class AccountsController < ApplicationController
#action to authenticate user #here my model name is account
  before_action :authenticate_account!  
 
  def index
  #user feed
  end

  def show
  #user profile
  end

end
