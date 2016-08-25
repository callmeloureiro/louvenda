class Sale < ActiveRecord::Base

  has_many :order_product
  has_many :products, through: :order_product

  belongs_to :payment

  belongs_to :client, :foreign_key => "client_id", :class_name => "Client"
  belongs_to :employee, :foreign_key => "employee_id", :class_name => "User"

  scope :sale_last_week, -> {
    where('created_at >= ?', 1.week.ago)
  }

  scope :sale_today, -> {
    where('created_at >= ?', Date.today)
  }

  def price=(val)
    val.sub!(',', '.') if val.is_a?(String)
    self['price'] = val
  end

end
