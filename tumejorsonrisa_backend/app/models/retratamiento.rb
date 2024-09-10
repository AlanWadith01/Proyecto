class Retratamiento < ApplicationRecord
    belongs_to :patient
  

    validates :tipoId, presence: true
    validates :id, presence: true
    validates :nombre, presence: true
    validates :odontologo, presence: true
    validates :fecha, presence: true
    validates :hora, presence: true
    validates :descripcion, presence: true
    validates :retratamientoPendiente, inclusion: { in: ['Sí', 'No'], message: "%{value} no es un valor válido" }
  end
  