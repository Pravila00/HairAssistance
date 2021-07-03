class SalonController < ApplicationController
  def list
    @salons = Salon.all
  end

  def index
    render json: Salon.all, status: :ok
  end

  def show
    @salon = Salon.find(params[:id])
  end

  def new
    @salon = Salon.new
  end

  def salon_params
    params.require(:salons).permit(:nombre, :horario, :localizacion)
  end

  def create
    @salon = Salon.new(salon_params)

    if @salon.save
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @salon = Salon.find(params[:id])
  end



  def update
    @salon = Salon.find(params[:id])

    if @salon.update(salon_param)
      redirect_to :action => 'show', :id=>@salon
    else
      #@subjects = Subject.all
      #render :action => 'edit'
    end
  end

  def salon_param
    params.require(:salon).permit(:nombre, :horario, :localizacion)
  end


  def delete
    Salon.find(params[:id]).destroy
    redirect_to :action => 'list', notice: 'La peluqueria se ha borrado correctamente'
  end

end
