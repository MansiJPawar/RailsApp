class AccountsController < ApplicationController
#action to authenticate user #here my model name is account
  before_action :authenticate_account!  
  before_action :set_account, only: [:profile]

  def index
    #user dashboard - post feed
    #create instance and load post
    @posts = Post.active
  end

  #show method renamed to profile 
  def profile
    #user profile
    @posts = @account.posts.active
  end

  #method to load profile for user
  def set_account
    #load account for user with params here
    @account =  Account.find_by_username(params[:username])
  end
end