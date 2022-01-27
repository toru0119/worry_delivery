class RenameAddressIdColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :address_id, :address
  end
end
