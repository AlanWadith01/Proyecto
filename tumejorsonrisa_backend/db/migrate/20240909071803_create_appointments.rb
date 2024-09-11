class AppointmentsController < ApplicationController
  before_action :set_patient, only: [:create]

  def create
    appointment = @patient.appointments.new(appointment_params)

    if appointment.save
      render json: { message: 'Cita creada exitosamente' }, status: :created
    else
      render json: { errors: appointment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_patient
    @patient = Patient.find_by(numero_documento: params[:numero_documento])
    if @patient.nil?
      render json: { error: 'Paciente no encontrado' }, status: :not_found
    end
  end

  def appointment_params
    params.require(:appointment).permit(:doctor, :fecha, :hora, :motivo)
  end
end


