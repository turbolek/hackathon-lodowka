class CreateSupplies < ActiveRecord::Migration
  def change
    create_table :supplies do |t|
      t.references :fridge, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :quantity
      t.date :expiration_date

      t.timestamps null: false
    end
  end
end
