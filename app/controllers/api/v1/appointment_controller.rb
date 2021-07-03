class Api::V1::AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @appointments = Appointment.all
    render json: @appointments, status:200
  end

  def show
    @appointment = Appointment.find(params[:id])
    render json: @appointment, status:200
  end

  def create
    @appointment = Appointment.new(appointment_param)

    if @appointment.save
      render json: @appointment, status:200
    else
      render json: { error: "Error al crear la cita" }
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.destroy
      render json: :nothing, status: :ok
    else
      render json: :nothing, status: :unprocessable_entity
    end
  end

  def update
    @appointment = Salon.find(params[:id])

    if @appointment.update(salon_param)
      render json: @appointment, status: :ok
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  private
  def appointment_params
    params.require(:appointments).permit(:persona, :fecha, :hora, :telefono, :salon_id)
  end

  def appointment_param
    params.require(:appointment).permit(:persona, :fecha, :hora, :telefono, :salon_id)
  end

  def current_appointment
    @appointment = Appointment.find(params[:id])
  end
end
