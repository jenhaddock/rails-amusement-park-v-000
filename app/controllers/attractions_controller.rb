class AttractionsController < ApplicationController
#  before_action :require_login, only: [:show]

  def index
    @attractions = Attraction.all
    @user = User.find(current_user)
  end

  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(id: current_user)
  end

  def new
    if User.find(current_user).admin?
      @attraction = Attraction.new
    else
      redirect_to root_path
    end
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render "new"
    end
  end

  def edit
    if User.find(current_user).admin?
      @attraction = Attraction.find_by(params[:id])
    else
      redirect_to attraction_path(Attraction.find_by(params[:id]))
    end
  end

  def update
    @attraction = Attraction.find_by(params[:id])
    @attraction.update(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :edit
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :happiness_rating, :nausea_rating, :min_height)
  end

end
