class CreateGardes < ActiveRecord::Migration[5.2]
  def change
    create_table :gardes do |t|
      t.string :name
      t.text :description
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :unity
      t.integer :quantity_max
      t.date :start_availability_date
      t.date :end_availability_date
      t.references :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
