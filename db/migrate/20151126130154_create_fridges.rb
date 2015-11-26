class CreateFridges < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
