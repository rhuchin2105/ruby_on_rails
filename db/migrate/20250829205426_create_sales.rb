class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.integer :cumtomer_id
      t.integer :seller_id
      t.integer :product_id
      t.integer :price
      t.integer :amount
      t.string :seller_address

      t.timestamps
    end
  end
end
