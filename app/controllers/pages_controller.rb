class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  def home
    @drones = Drone.all.select { |d| d.rate > 5 }
  end


  def vhome
    @drones = Drone.all.select { |d| d.rate > 5 }
    # This command uses an alternative layout home.html.erb for home page
    # render :layout => 'home'
  end
end
