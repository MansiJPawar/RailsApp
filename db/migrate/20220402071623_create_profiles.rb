class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :email
      t.string :name
      t.string :image
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :age
      t.boolean :gender
      t.bigint :phone
      t.string :uid
      t.string :provider
      t.boolean :is_active, default: true
      t.boolean :is_block, default: false

      t.timestamps
    end
  end
end
