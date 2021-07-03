class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string  :persona
      t.string :fecha
      t.string :hora
      t.integer :telefono, unique: true

      t.references :salon, index: true

    end
  end
end
