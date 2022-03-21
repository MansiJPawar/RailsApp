class Like < ApplicationRecord
  #association
  belongs_to :post
  belongs_to :account

  #validations#same user cant like same post multiple times
  validates_uniqueness_of :post_id, scope: :account_id

  # to update like counts on post
  after_create :increase_post_like_counter

  after_destroy :decrease_post_like_counter
  
  private

  def increase_post_like_counter
    Post.find(self.post_id).increment(:total_likes_count).save
  end

  def decrease_post_like_counter
    Post.find(self.post_id).decrement(:total_likes_count).save
  end
end