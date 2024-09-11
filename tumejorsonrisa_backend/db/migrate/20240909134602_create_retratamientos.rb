class CreateRetratamientos < ActiveRecord::Migration[6.1]
  def change
    create_table :retratamientos do |t|
      t.string :tipoId, null: false
      t.string :id, null: false
      t.string :nombre, null: false
      t.string :odontologo, null: false
      t.date :fecha, null: false
      t.time :hora, null: false
      t.text :descripcion, null: false
      t.string :retratamientoPendiente, null: false
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
