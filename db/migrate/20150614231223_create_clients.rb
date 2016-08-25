class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :telephone
      t.string :cellphone
      t.string :email
      t.string :CEP
      t.string :address_line
      t.string :number
      t.string :district
      t.string :city
      t.string :state
      t.boolean :status, :default => true
      
      t.timestamps null: false
    end
  end
end
