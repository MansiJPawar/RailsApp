# == Schema Information
#
# Table name: accounts
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Account < ApplicationRecord
  #method #adds password and password confirmation saved in db can be used for authentication
  has_secure_password
  
  has_many :facebook_accounts
  #validation for email
  # validates :email, presence: true, format: { with: /\A[^@\s]+[^@\s].\z/, message: "must be valid email address" }
end
