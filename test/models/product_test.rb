# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  brand_name :string
#  category   :string
#  details    :string
#  gender     :string
#  image      :string
#  in_stock   :boolean          default(TRUE)
#  logo       :string
#  name       :string
#  price      :string
#  quantity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
