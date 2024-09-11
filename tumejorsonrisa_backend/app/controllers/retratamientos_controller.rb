class RetratamientosController < ApplicationController
    before_action :set_retratamiento, only: [:show, :update, :destroy]
  
    def index
      @retratamientos = Retratamiento.where('id LIKE ?', "%#{params[:query]}%")
      render json: @retratamientos
    end
  
    def show
      render json: @retratamiento
    end
  
    def create
      @retratamiento = Retratamiento.new(retratamientos_params)
      if @retratamiento.save
        render json: @retratamiento, status: :created
      else
        render json: @retratamiento.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @retratamiento.update(retratamientos_params)
        render json: @retratamiento
      else
        render json: @retratamiento.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @retratamiento.destroy
      head :no_content
    end
  
    private
  
    def set_retratamiento
      @retratamiento = Retratamiento.find(params[:id])
    end
  
    def retratamientos_params
      params.require(:retratamiento).permit(:tipoId, :id, :nombre, :odontologo, :fecha, :hora, :descripcion, :retratamientoPendiente, :patient_id)
    end
  end
  