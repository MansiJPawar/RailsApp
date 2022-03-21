class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
     t.references :account
     t.references :post
     t.timestamps
    end
  end
end
