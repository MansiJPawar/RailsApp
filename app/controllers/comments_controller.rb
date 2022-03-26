class CommentsController < ApplicationController
  before_action :authenticate_account!   
  
  def create
    #direct to create comment
    @comment = Comment.new(comment_params)

    #associate and check if user signed in
    @comment.account_id = current_account.id if account_signed_in?

    #template to save comment and redirect
    if @comment.save
      # return_to : return param for hidden field in form
      # if value set return back to post
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : dashboard_path
      redirect_to return_url , flash: { success: "Comment was created successfully!"}
    else
      redirect_to dashboard_path, flash: { success: "Comment was created successfully"}
    end
  end

  private 
  
    #strong params
    def comment_params
      params.require(:comment).permit(:comment, :post_id, :return_to)
    end
end