class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    if params[:start].blank? || params[:end].blank?
      # @drones = Drone.where.not(latitude: nil, longitude: nil)
      @drones = Drone.near(params[:address], 10)
      @marker_hash = Gmaps4rails.build_markers(@drones) do |drone, marker|
        marker.lat drone.latitude
        marker.lng drone.longitude
        # marker.infowindow render_to_string(partial: "/drones/map_box", locals: { drone: drone })
      end

    else
      start_date = date_formatting(params[:start])
      end_date = date_formatting(params[:end])
      @drones = Drone.near(params[:address], 10).select { |d| d.available?(start_date, end_date) }


      # @drones = Drone.all.select { |d| d.available?(start_date, end_date) }
      # @drones = @drones.where.not(latitude: nil, longitude: nil)

      @marker_hash = Gmaps4rails.build_markers(@drones) do |drone, marker|
        marker.lat drone.latitude
        marker.lng drone.longitude
        # marker.infowindow render_to_string(partial: "/drones/map_box", locals: { drone: drone })
      end
    end

    if params[:distance] == "endurance"
      @drones = Drone.category("endurance")
    elsif params[:distance] == "mid range"
      @drones = Drone.category("mid range")
    elsif params[:distance] == "close range"
      @drones = Drone.category("close range")
    elsif params[:distance] == "short range"
      @drones = Drone.category("short range")
    end


    if params[:price] == "50€"
      @drones = Drone.rate(50)
    elsif params[:price] == "100€"
      @drones = Drone.rate(100)
    elsif params[:price] == "150€"
      @drones = Drone.rate(150)
    elsif params[:price] == "200€"
      @drones = Drone.rate(200)
    end

  end


  def show
    @drone = Drone.find(params[:id])
    @booking = Booking.new()
    @reviews = @drone.reviews.where(type: "DroneReview")
  end

  def new
    @drone = Drone.new()
  end

  def create
    @drone = Drone.new(drone_params)
    @drone.user = current_user
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

  def date_formatting(date_string)
    items = date_string.split("/")
    date = Date.new(items[2].to_i, items[0].to_i, items[1].to_i)
    return date
  end

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(:title, :description, :rate, :address, :max_alt, :category, :range, :battery_life, photos: [] )
  end

end
