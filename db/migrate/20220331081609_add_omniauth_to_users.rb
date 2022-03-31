class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :first_name, :string
    add_column :users, :profile_image, :text
    add_column :users, :last_name, :string
    add_column :users, :phone_no, :bigint
    add_column :users, :age, :integer
    add_column :users, :gender, :boolean
    add_column :users, :address, :string
  end
end
