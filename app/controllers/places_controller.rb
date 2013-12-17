class PlacesController < ApplicationController
  def index
  	@places = Place.all
  end

  def show
  	@place = Place.find(params[:id])
    @nearby_places= @place.nearbys(2, units: :km)
  end

  def new
  	@place = Place.new
  end

  def edit
  	@place = Place.find(params[:id])
  end

  def create
  	@place = Place.new(place_params)
  	if @place.save
  		redirect_to place_path(@place)
  	else
  		render :new
  	end
  end

  def update
  	@place = Place.find(params[:id])
  	if @place.update_attributes(place_params)
  		redirect_to place_path(@place)
  	else
  		render :edit
  	end
  end

  def destroy
  	@place = Place.find(params[:id])
  	@place.destroy
  	redirect_to places_path
  end

  private
  def place_params
  	params.require(:place).permit(:name, :description, :address, :phone, :email, :hours, :latitude, :longitude, :category)
  end
end
