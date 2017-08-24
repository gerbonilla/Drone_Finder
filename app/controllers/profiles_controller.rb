class ProfilesController < ApplicationController


  before_action :set_profile, only: [:show, :update]

  def show
    @bookings = current_user.bookings.order(:status)
    @booking = Booking.find(params[:id])
  end

  def update
    if @profile.update(user_params)
      redirect_to profile_path(@profile), alert:"user created successfully."
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
