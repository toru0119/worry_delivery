class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  belongs_to :new_employee, optional: true

  enum order_status: { making: 0, preparing: 1, shipped: 2 }
  enum address: { seat1: 0, seat2: 1, seat3: 2 }
end