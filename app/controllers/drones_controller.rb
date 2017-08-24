class DronesController < ApplicationController
  before_action :set_drone, only: [:show, :edit, :update, :destroy]

  def index
    if params[:start].blank? || params[:end].blank?
      # @drones = Drone.where.not(latitude: nil, longitude: nil)

      !params[:rate].blank? ? rate_par = params[:rate].to_i : rate_par = 999999
      !params[:range].blank? ? range_par = params[:range].to_i : range_par = 0

      @drones = Drone.near(params[:address], 10)

      @drones = @drones.select { |d| d.rate <= rate_par } unless @drones.blank?
      @drones = @drones.select { |d| d.range >= range_par } unless @drones.blank?

      @marker_hash = Gmaps4rails.build_markers(@drones) do |drone, marker|
        marker.lat drone.latitude
        marker.lng drone.longitude
        # marker.infowindow render_to_string(partial: "/drones/map_box", locals: { drone: drone })
      end

    else
      start_date = date_formatting(params[:start])
      end_date = date_formatting(params[:end])

      !params[:rate].blank? ? rate_par = params[:rate].to_i : rate_par = 999999
      !params[:range].blank? ? range_par = params[:range].to_i : range_par = 0

      @drones = @drones.select { |d| d.rate <= rate_par } unless @drones.blank?
      @drones = @drones.select { |d| d.range >= range_par } unless @drones.blank?

      @drones = Drone.near(params[:address], 10).select { |d| d.available?(start_date, end_date) }



      @marker_hash = Gmaps4rails.build_markers(@drones) do |drone, marker|
        marker.lat drone.latitude
        marker.lng drone.longitude
        # marker.infowindow render_to_string(partial: "/drones/map_box", locals: { drone: drone })
      end
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
