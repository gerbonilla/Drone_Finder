class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    @drones = Drone.all
  end

  def show
  end

  def new
  end

  def create
     @drone = Drone.new(drone_params)
    if @drone.save
      redirect_to drone_path(@drone)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @drone = Drone.new(drone_params)
    if @drone.update
      redirect_to drone_path(@drone)
    else
      render :new
    end
  end

  def destroy
    @drone.destroy
    redirect_to drones_path
  end

  private

  def set_cocktail
    @drone = Drone.find(params[:id])
  end

end
