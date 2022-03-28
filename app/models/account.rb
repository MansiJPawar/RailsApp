class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]

  #omniauth for github social login
  def self.from_omniauth(access_token)
    #if user exit login 
    data = access_token.info
    account = Account.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    #user not logged in then create
    unless account
      account = Account.create(
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    account
  end

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
    Follower.where(follower_id: self.id).count
  end

  #method to reuse for count following
  def following
    Follower.where(following_id: self.id).count
  end
end