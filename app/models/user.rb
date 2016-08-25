class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :seller, :class_name => 'Sale', :foreign_key => 'employee_id'

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

end
