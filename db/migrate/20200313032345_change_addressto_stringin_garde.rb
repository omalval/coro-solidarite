class ChangeAddresstoStringinGarde < ActiveRecord::Migration[5.2]
  def change
    change_column :gardes, :address, :string
  end
end
