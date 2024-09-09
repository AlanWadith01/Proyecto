class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :nombre
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :tipo_documento
      t.string :numero_documento
      t.string :direccion
      t.string :ciudad
      t.string :telefono
      t.string :estado_civil
      t.string :sexo
      t.string :raza
      t.string :tipo_sangre
      t.string :ocupacion
      t.string :eps
      t.string :alergias
      t.string :cirugias
      t.string :emergency_nombre
      t.string :emergency_direccion
      t.string :emergency_ciudad
      t.string :emergency_telefono
      t.string :emergency_relacion

      t.timestamps
    end
  end
end
