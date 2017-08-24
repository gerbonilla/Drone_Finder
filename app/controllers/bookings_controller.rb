class BookingsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @booking = Booking.new
    @drone = Drone.find(params[:drone_id])
  end

  def create
    @drone = Drone.find(params[:drone_id])
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.drone_id = params[:drone_id]
    @booking.original_rate = @booking.total_amount(@booking.start_date, @booking.end_date, @drone.rate)
    if @booking.user_id = @drone.user_id
      @booking.status = "personal"
      @booking.save
      flash[:notice] = "you reserved your own drone!"
      redirect_to drone_path(@booking.drone_id)
    else
      @booking.status = "pending"
      if @booking.save
        flash[:notice] = "your request has been sent!"
        redirect_to drone_path(@booking.drone_id)
      else
        render :new
      end
    end
  end

  def update
    @booking = Booking.find(params[:id])
    case params[:status]
    when "confirmed" then @booking.confirm
    when "declined" then @booking.decline
    when "cancelled" then @booking.decline
    end
    @booking.save
    redirect_to profile_path(current_user.id)
  end

private
  def booking_params
    params.require(:booking).permit(:user_id, :drone_id, :start_date, :end_date, :original_rate, :status, :message)
  end
end
