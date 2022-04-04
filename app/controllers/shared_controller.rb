class SharedController < ApplicationController

  def index
    @users = User.all
  end
  
end
