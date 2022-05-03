# == Schema Information
#
# Table name: product_customers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_product_customers_on_product_id  (product_id)
#  index_product_customers_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (user_id => users.id)
#
class ProductCustomer < ApplicationRecord
  #association
  belongs_to :user
  belongs_to :product
end
