class RidesController < ApplicationController

  def new
    @ride = Ride.create(attraction_id: params[:attraction_id],
                        user_id: current_user)

    @message = @ride.take_ride
    @user = User.find(current_user)
    flash[:notice] = @message
    redirect_to user_path(current_user)
  end

end
