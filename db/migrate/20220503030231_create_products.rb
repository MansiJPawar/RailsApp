class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :quantity
      t.string :details
      t.string :gender
      t.string :category
      t.string :image
      t.string :logo
      t.string :brand_name
      t.string :price
      t.boolean :in_stock, default: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
