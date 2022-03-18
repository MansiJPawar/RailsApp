class AccountsController < ApplicationController
#action to authenticate user #here my model name is account
  before_action :authenticate_account!  
 
  def index
    #user dashboard - post feed
    #create instance and load post
    @posts = Post.active
  end

  def show
    #user profile
  end

end