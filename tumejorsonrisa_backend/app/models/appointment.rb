class Appointment < ApplicationRecord
  belongs_to :patient

  validates :telefono, presence: true, format: { with: /\A\d{7,15}\z/, message: "debe contener entre 7 a 15 dígitos numéricos" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "debe ser un correo válido" }
  validates :doctor, presence: true
  validates :fecha, presence: true
  validates :hora, presence: true
  validates :motivo, presence: true, length: { maximum: 255, message: "no debe exceder los 255 caracteres" }

  validate :fecha_no_en_el_pasado

  private

  def fecha_no_en_el_pasado
    if fecha.present? && fecha < Date.today
      errors.add(:fecha, "no puede estar en el pasado")
    end
  end
end

