# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  age                    :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :boolean
#  image                  :text
#  last_name              :string
#  name                   :string
#  phone_no               :bigint
#  profile_image          :text
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default(0)
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,  :omniauthable, :omniauth_providers => [:facebook]
         
  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #     user.email = auth.info.email
  #     user.password = Devise.friendly_token[0,20]
  #     name = auth.info.name.split(' ')
  #     user.first_name =  name.first  # assuming the user model has a name
  #     user.last_name =  name.last  # assuming the user model has a name
  #     #user.image = auth.info.image # assuming the user model has an image
  #     # If you are using confirmable and the provider(s) you use validate emails,
  #     # uncomment the line below to skip the confirmation emails.
  #     # user.skip_confirmation!
  #   end
  #  user
  # end

  def self.from_omniauth(access_token)
    # data = access_token.info
    user = User.where(email: access_token.info.email).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.first_name = access_token.name
    user.name = access_token.info.name
    user.image = access_token.info.image
    user.gender = access_token.info.gender
 
    user.save

    user
  end
end
