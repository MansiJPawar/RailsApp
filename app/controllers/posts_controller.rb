class PostsController < ApplicationController
  before_action :authenticate_account!   
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
  end

  private 

  #strong params
  def post_params
    params.require(:post).permit(:image, :image_cache, :description)
  end
end