class PostsController < ApplicationController
  before_action :authenticate_account!
  #to load post on only show view
  before_action :set_post,only: [:show] 
  
  #to create new post
  def new
    @post = Post.new
  end 
  
  def create
    #direct to create post
    @post = Post.new(post_params)

    #associate and check if user signed in
    @post.account_id = current_account.id if account_signed_in?

    #template to save post and redirect
    if @post.save
      redirect_to dashboard_path, flash: { success: "Post was created successfully!"}
    else
      redirect_to new_post_path, flash: { success: "Post was created successfully"}
    end
  end

  def show  
    #set comment on show view
    @comment =  Comment.new
    #include method no need to make query while we loop comment section just pass postid
    @comments = Comment.includes(:account).where(post_id: @post.id)
  end

  private

  #load post for viewing #check param exist before post load
  def set_post
    #include methods used to connect all our fields(comments and account)
    @post = Post.find(params[:id]) if params[:id].present?
  end

  #strong params
  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end
end