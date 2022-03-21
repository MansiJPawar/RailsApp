module PostsHelper
 #post liked by user already and return true or false
 def post_liked_by_user? post_id
   Like.where(post_id: post_id, account_id: current_account.id) 
 end
end