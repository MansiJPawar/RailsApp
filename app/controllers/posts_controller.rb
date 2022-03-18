class PostsController < ApplicationController
  
  #to create new post
  def new
    @post = Post.new
  end 
  
  def create
    #direct to create post
    @post = Post.new(post_params)
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
    params.require(:post).permit(:image, :image_cache)
  end

end