class Like < ApplicationRecord
  #association
  belongs_to :post
  belongs_to :account

  #validations#same user cant like same post multiple times
  validates_uniqueness_of :post_id, scope: :account_id

end