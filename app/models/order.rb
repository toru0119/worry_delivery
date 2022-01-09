class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  belongs_to :new_employee
end
