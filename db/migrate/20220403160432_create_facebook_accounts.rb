class CreateFacebookAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :facebook_accounts do |t|
      t.belongs_to :account, foreign_key: true
      t.string :name
      t.string :username
      t.string :image
      t.string :secret

      t.timestamps
    end
  end
end
