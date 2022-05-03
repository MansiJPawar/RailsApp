# == Schema Information
#
# Table name: feedbacks
#
#  id         :bigint           not null, primary key
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_feedbacks_on_product_id  (product_id)
#  index_feedbacks_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :product
end
