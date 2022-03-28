class AccountsController < ApplicationController
#action to authenticate user #here my model name is account
  before_action :authenticate_account!  
  before_action :set_account, only: [:profile]

  def index 
    #user dashboard feed 
    follower_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    follower_ids << current_account.id
    
      #user dashboard - post feed
    #create instance and load post
    #@posts = Post.active
    @posts = Post.includes(:account).where(account_id: follower_ids).active
    
    #comment
    @comment = Comment.new
    #user following ids
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    #populate user at suggestions
    @follower_suggestions = Account.where.not(id: following_ids)
  
  end

  #show method renamed to profile 
  def profile
    #user profile
    @posts = @account.posts.active
  end
  
  #handle follow 
  def follow_account
    #accept params passed
    follower_id = params[:follow_id]
    if Follower.create!(follower_id: current_account.id, following_id: follower_id)
      flash[:success] = "Now following user"
    else 
      flash[:danger] = "Unable to add follower"
    end
      redirect_to dashboard_path
  end

  private 

  #method to load profile for user
  def set_account
    #load account for user with params here
    @account =  Account.find_by_username(params[:username])
  end
end