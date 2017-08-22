class ProfilesController < ApplicationController


  before_action :set_profile, only: [:show, :update]

  def show
    @user_drones = Drone.all.select { |d| d.user_id = @profile}
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
    params.require(:user).permit(:first_name, :last_name, :description, :email)
  end


end
