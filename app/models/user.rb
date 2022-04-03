# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  age                    :integer
#  deactivated            :boolean
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

  #csv
  # def self.to_csv(fields = column_name, options = {})
  #   CSV.generate(options) do |csv|
  #     csv << fields
  #     all.each do |business|
  #       csv << user.attributes.values_at(*fields)
  #     end
  #   end
  # end

  #active users
  # def account_active?
  #   blocked_at.nil?
  # end

  # def active_for_authentication?
  #   super && account_active?
  # end

  # Whenever active_for_authentication? returns false, 
  # Devise asks the reason why your model is inactive using the inactive_message method.
  # def inactive_message
  #   account_active? ? super : :locked
  # end




  # def active_for_authentication?
  #   super and self.allowed_to_log_in?
  # end
  
  # def destroy
  #   update_attributes(deactivated: true) unless deactivated
  # end

  # def active_for_authentication?
  #   super && !deactivated
  # end



  


  #user details
  def self.from_omniauth(access_token)
    # data = access_token.info
    @user = User.where(email: access_token.info.email).first
    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      @user = User.create(
        email: access_token.info.email,
        password: Devise.friendly_token[0,20]
      )
    end
    @user.uid = access_token.uid
    @user.provider = access_token.provider
    @user.first_name = access_token.name
    @user.name = access_token.info.name
    @user.image = access_token.info.image
    @user.gender = access_token.info.gender
    # user.oauth_token = auth.credentials.token
    # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    @user.save

    @user
  end
end
