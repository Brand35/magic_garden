class AddAddressToItems < ActiveRecord::Migration[7.2]
  def change
    add_column :items, :address, :string
  end
end
