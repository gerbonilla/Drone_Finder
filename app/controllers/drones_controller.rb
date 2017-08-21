class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end

  def show
    @drone = Drone.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
