class ChangeDatatypeAddressIdOfOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :address_id, :string
  end
end
