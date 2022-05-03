# == Schema Information
#
# Table name: offers
#
#  id          :bigint           not null, primary key
#  coupon_code :string
#  end_date    :bigint
#  is_expired  :boolean          default(TRUE)
#  name        :string
#  start_date  :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :bigint
#
# Indexes
#
#  index_offers_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
class Offer < ApplicationRecord
  #association
  belongs_to :product
end
