class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find_by(id: session[:user_id])
  end
end
