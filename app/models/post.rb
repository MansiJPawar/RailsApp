class Post < ApplicationRecord
  mount_uploader :image, ImageUploader 
  # user can delete post later, soft delete remain in db
  scope :active, -> { where active: true }
end
