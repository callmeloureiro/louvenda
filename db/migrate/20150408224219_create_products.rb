class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :sku, :unique => true
      t.string :name
      t.float :price
      t.integer :quantify
      t.integer :category_id
      t.timestamps null: false
    end
    add_index :products, :category_id
  end
end
