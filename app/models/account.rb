class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #carrier wave for image upload
  mount_uploader :image, ImageUploader 

  #association
  has_many :posts
  has_many :likes

  #method to reuse
  def full_name
    "#{first_name} #{last_name}"
  end

  #method to reuse for count total_followers
  def total_followers
    0
  end

  #method to reuse for count following
  def following
    0
  end
end
