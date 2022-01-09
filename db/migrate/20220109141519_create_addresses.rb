class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :customer_id
      t.integer :order_status, default: 0
      t.integer :new_employee_id
      t.integer :address_id
      t.timestamps
    end
  end
end
