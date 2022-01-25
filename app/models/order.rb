class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details
  belongs_to :new_employee, optional: true

  enum order_status: { waiting: 0, paid_up: 1, making: 2, preparing: 3, shipped: 4 }
  enum addresses: { seat1: 0, seat2: 1, seat3: 2 }
end
