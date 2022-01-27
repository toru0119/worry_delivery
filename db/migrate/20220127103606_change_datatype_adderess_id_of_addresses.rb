class ChangeDatatypeAdderessIdOfAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :address_id, :string
  end
end
