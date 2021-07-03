class CreateSalons < ActiveRecord::Migration[6.1]
  def change
    create_table :salons do |t|
      t.string :horario
      t.string :localizacion
      t.string :nombre, unique: true, null: false
    end
  end
end
