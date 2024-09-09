# app/models/appointment.rb
class Appointment < ApplicationRecord
    belongs_to :patient
  
    validates :tipoId, :id, :nombre, :odontologo, :fecha, :hora, :descripcion, presence: true
  end
  