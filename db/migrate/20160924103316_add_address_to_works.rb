class AddAddressToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :address, :string
  end
end
