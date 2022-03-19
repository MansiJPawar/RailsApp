class Post < ApplicationRecord
  mount_uploader :image, ImageUploader 
  #association
  belongs_to :account
 
  # user can delete post later, soft delete remain in db
  scope :active, -> { where active: true }
end
