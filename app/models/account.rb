class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #association
  has_many :posts

  #method to reuse
  def full_name
    "#{first_name} #{last_name}"
  end
end
