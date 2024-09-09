class Patient < ApplicationRecord
    has_many :appointments
    has_many :x_rays
    
    validates :nombre, :apellido, :fecha_nacimiento, :tipo_documento, :numero_documento, :direccion, :ciudad, :telefono, :estado_civil, :sexo, :raza, :tipo_sangre, presence: true
  end
  