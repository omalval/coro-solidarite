class AddContacttoGarde < ActiveRecord::Migration[5.2]
  def change
    add_column :gardes, :contact, :string
  end
end
