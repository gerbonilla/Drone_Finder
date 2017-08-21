class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @drones = Drone.all.select { |d| d.rate > 5 }
  end
end
