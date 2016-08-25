class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :payment_id
      t.integer :client_id
      t.integer :employee_id
      t.float :price
      t.timestamps null: false
    end
    add_index :sales, :payment_id
    add_index :sales, :client_id
    add_index :sales, :employee_id
  end
end
