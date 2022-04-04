class SharedController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def admin 
    # @user = User.find(params[:id])
  end

  def userlogin
  end
end
