class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :new_employee_id
      t.integer :address_id
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
