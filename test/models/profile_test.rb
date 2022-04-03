# == Schema Information
#
# Table name: profiles
#
#  id         :bigint           not null, primary key
#  address    :string
#  age        :integer
#  email      :string
#  first_name :string
#  gender     :boolean
#  image      :string
#  is_active  :boolean          default(TRUE)
#  is_block   :boolean          default(FALSE)
#  last_name  :string
#  name       :string
#  phone      :bigint
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
