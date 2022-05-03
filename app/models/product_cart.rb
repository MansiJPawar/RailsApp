# == Schema Information
#
# Table name: product_carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint
#  product_id :bigint
#
# Indexes
#
#  index_product_carts_on_cart_id     (cart_id)
#  index_product_carts_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (product_id => products.id)
#
class ProductCart < ApplicationRecord
  #association
  belongs_to :cart
  belongs_to :product
end
