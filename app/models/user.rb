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
  
  # after_commit :add_default_avatar, on: %i[create update]
  
  #enum roles
  enum role: [:user, :superadmin]

  #image
  # mount_uploader :avatar, AvatarUploader
  # has_one_attached :avatar

  # def avatar_thumbnail 
  #   if avatar.attached?
  #     avatar.variant(resize: "150x150").processed 
  #   else
  #     "/perfil.jpg"
  #   end
  # end

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



  def active_user?
    if current_user.email.present? && current_user.deactivated

    end
  end

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

  # #user details
  # def self.from_omniauth(access_token)
  #   # data = access_token.info
  #   @user = User.where(email: access_token.info.email).first
  #   # Uncomment the section below if you want users to be created if they don't exist
  #   unless user
  #     @user = User.create(
  #       email: access_token.info.email,
  #       password: Devise.friendly_token[0,20]
  #     )
  #   end
  #   @user.uid = access_token.uid
  #   @user.provider = access_token.provider
  #   @user.first_name = access_token.name
  #   @user.name = access_token.info.name
  #   @user.image = access_token.info.image
  #   @user.gender = access_token.info.gender
  #   # user.oauth_token = auth.credentials.token
  #   # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #   @user.save

  #   @user
  # end

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

  private 

  # def default_avatar 
  #   unless avatar.attached?
  #     avatar.attach(
  #       io: File.open(
  #         Rails.root.join(
  #           'app','assets','images','perfil.jpg'
  #         )
  #       ),
  #       filename: 'perfil.jpg',
  #       content_type: 'image/jpg'
  #     )
  #   end
  # end
    
end
