class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :image
      # to check if post is active or deleted
      t.boolean :active
      # to know which user created post
      t.references :account
      #post created at
      t.timestamps
    end
  end
end
