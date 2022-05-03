class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :coupon_code
      t.references :product, foreign_key: true
      t.boolean :is_expired, default: true
      t.bigint :end_date
      t.bigint :start_date

      t.timestamps
    end
  end
end
