module PostsHelper
  #check if post liked by user already n return boolean
  def post_liked_by_user? post_id
   #check if both values match #n+1#called each time on loop for post in loop 
    Like.where(post_id: post_id, account_id: current_account.id).any?
  end
end