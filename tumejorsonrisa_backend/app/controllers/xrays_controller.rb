# app/controllers/xrays_controller.rb
class XraysController < ApplicationController
    before_action :set_x_ray, only: [:show, :update, :destroy]
  
    def index
      @xrays = XRay.where(patient_id: params[:patient_id])
      render json: @xrays
    end
  
    def show
      render json: @x_ray
    end
  
    def create
      @x_ray = XRay.new(x_ray_params)
      if @x_ray.save
        render json: @x_ray, status: :created
      else
        render json: @x_ray.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @x_ray.update(x_ray_params)
        render json: @x_ray
      else
        render json: @x_ray.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @x_ray.destroy
      head :no_content
    end
  
    private
  
    def set_x_ray
      @x_ray = XRay.find(params[:id])
    end
  
    def x_ray_params
      params.require(:x_ray).permit(:url, :patient_id)
    end
  end
  