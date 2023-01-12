class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.references :courier, null: false, foreign_key: true
      t.string :vehicle_type

      t.timestamps
    end
  end
end
