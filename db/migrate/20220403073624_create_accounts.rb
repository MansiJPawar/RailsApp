class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      #not allow insert into db null: false adding protection
      t.string :email, null: false
      t.string :password_digest

      t.timestamps
    end
  end
end
