class ProfilesController < ApplicationController


  before_action :set_profile, only: [:show, :update]

  def show
    @user_drones = current_user.drones
    @drone_bookings = []
    @user_drones.each do |drone|
      drone.bookings.each do |booking|
        @drone_bookings << booking
      end
    end
    @bookings = current_user.bookings.order(status: :desc)
    @booking = Booking.find(params[:id])
  end

  def update
    if @profile.update(user_params)
      flash[:notice] = "Your profile was updated!"
      redirect_to profile_path(@profile)
    else
      render :new, alert: "Error creating user."
    end
  end



private

  def set_profile
    @profile = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description, :email, :photo)
  end


end
