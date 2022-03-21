class Follower < ApplicationRecord
  #association
  #belongs_to :accounts
  #validations
  validates_uniqueness_of :follower_id, scope: :following_id  
end