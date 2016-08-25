class Product < ActiveRecord::Base

  validates :sku, presence: true, uniqueness: true

  belongs_to :category, dependent: :destroy

  has_many :order_product
  has_many :sales, through: :order_product

  def price=(val)
    val.sub!(',', '.') if val.is_a?(String)
    self['price'] = val
  end

end
