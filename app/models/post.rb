class Post < ApplicationRecord
  #new post first
  default_scope {order created_at: :desc}

  #carrier wave for image upload
  mount_uploader :image, ImageUploader 
  
  #association
  belongs_to :account
  has_many :likes
  
  #before create post set active 
  before_create :set_active

  # user can delete post later, soft delete remain in db
  scope :active, -> { where active: true }

  def total_likes
    0
  end

  private

  #set active by default#by here or by migration
  def set_active
    self.active = true
  end

end