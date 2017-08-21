class DronesController < ApplicationController
  def index
    @drones = Drone.all
  end

  def show
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

private

  def drone_params
    params.require(:drone).permit(:photo)
  end

end
