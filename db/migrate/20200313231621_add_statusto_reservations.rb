class AddStatustoReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :reservations, :status, :string, default: "en attente"
  end
end
