# == Schema Information
#
# Table name: facebook_accounts
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string
#  secret     :string
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint
#
# Indexes
#
#  index_facebook_accounts_on_account_id  (account_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#
require 'test_helper'

class FacebookAccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
