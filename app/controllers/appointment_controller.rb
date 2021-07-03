class AppointmentController < ApplicationController
  def list
    @appointments = Appointment.all
    @appointments = @appointments.sort_by{|e| e[:fecha]}
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
    @salons = Salon.all
  end

  def create
    @appointment = Appointment.create(appointment_params)

    if @appointment.save
      redirect_to :action => 'list'
    else
      @salons = Salon.all
      render :action => 'new'
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    @salons = Salon.all
  end

  def update
    @appointment = Appointment.find(params[:id])

    if @appointment.update(appointment_param)
      redirect_to :action => 'show', :id => @appointment
    else
      @salons = Salon.all
      render :action => 'edit'
    end
  end

  def delete
    Appointment.find(params[:id]).destroy
    redirect_to :action => 'list'
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
