class Api::V1::SalonController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    salons = Salon.all
    render json: salons, status:200
  end

  def show
    salon = Salon.find(params[:id])
    render json: salon, status:200
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      render json: @salon, status: :created
    else
      render json: @salon.errors, status: :unprocessable_entity
    end
  end

  def delete
    Salon.find(params[:id]).destroy
    if @salon.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  def update
    @salon = Salon.find(params[:id])

    if @salon.update(salon_param)
      render json: @salon, status: :ok
    else
      render json: @salon.errors, status: :unprocessable_entity
    end
  end

  def salon_param
    params.require(:salon).permit(:nombre, :horario, :localizacion)
  end

  def salon_params
    params.require(:salons).permit(:nombre, :horario, :localizacion)
  end


end
