class CitiesController < ApplicationController

  def new
    @state = State.find( params[:state_id] )
    # show me a create form
  end

  def create
    state = State.find( params[:state_id] )
    city = City.create( city_params )
    state.cities << city
  end

  def edit
    @state = State.find( params[:state_id] )
    @city = City.find( params[:id] )   
    # show me an update form 
  end

  def update
    city = City.find( params[:id] )
    city.update( city_params )
  end

  private

  def city_params
    params.require(:city).permit(:name, :population, :state_id)
  end

end
