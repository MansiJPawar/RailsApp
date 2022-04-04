# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  age                    :integer
#  avatar                 :string
#  deactivated            :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  gender                 :boolean
#  image                  :text
#  job_profile            :string
#  last_name              :string
#  name                   :string
#  phone_no               :bigint
#  profile_image          :text
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          default("user")
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
  
  #enum roles
  enum role: [:user, :superadmin]

  #latest user first
  # default_scope {order created_at: :desc}
  
  def username 
    return self.email.split('@')[0].capitalize
  end

  def active_user?
    if current_user.email.present? && current_user.deactivated

    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
