# == Schema Information
#
# Table name: orders
#
#  id               :bigint           not null, primary key
#  delivery_charges :bigint
#  is_placed        :boolean          default(FALSE)
#  payment_amount   :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :bigint
#  user_id          :bigint
#
# Indexes
#
#  index_orders_on_product_id  (product_id)
#  index_orders_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  #association
  belongs_to :product
  belongs_to :user
end
