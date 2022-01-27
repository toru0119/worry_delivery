class ChangeDatatypeAddressOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :address, :integer
  end
end
