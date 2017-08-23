class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @drones = Drone.all.select { |d| d.rate > 5 }

    # I just to a stab at this... will have to play with it later
    # Idea is that it would send @drones within 10km of address given.
    # @drones = Drone.near(params[:address], 10)
  end
end
