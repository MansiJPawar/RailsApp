class LikesController < ApplicationController
  before_action :authenticate_account!   
  
  def save_like
    #id to  capture
    @like = Like.new(post_id: params[:post_id], account_id: current_account.id)

    #for like
    @post_id = params[:post_id]

    existing_like =  Like.where(post_id: params[:post_id], account_id: current_account.id)
    
    #template to save post and redirect
    #like to send response and ajax to handle
      respond_to do |format|
        format.js { 
          if existing_like.any?
            #like already exist for this user
            existing_like.first.destroy
            @success = false
          elsif @like.save
            #after code execution render this partial
            @success = true
          else
            @success = false
          end
          render "posts/like"
        }   
    end
  end
end