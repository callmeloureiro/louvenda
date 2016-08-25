class AddInfosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name,         :string
    add_column :users, :cpf,          :string
    add_column :users, :birthday,     :string
    add_column :users, :telephone,    :string
    add_column :users, :cellphone,    :string
    add_column :users, :level,        :integer, :default => 0
    add_column :users, :address_line, :string
    add_column :users, :number,       :integer
    add_column :users, :CEP,          :string
    add_column :users, :district,     :string
    add_column :users, :city,         :string
    add_column :users, :state,        :string
    add_column :users, :status,       :boolean, :default => true
  end
end
