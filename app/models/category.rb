class Category < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :product
  
end
