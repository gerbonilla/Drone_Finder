class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit]

  def show
  end

  def edit
  end


private

  def set_profile
    @profile = User.find(params[:id])
  end

end
