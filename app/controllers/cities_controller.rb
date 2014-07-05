class CitiesController < ApplicationController

  def new
    @state = State.find( params[:state_id] )
    @city = City.new(:state=>@state) 
    # show me a create form
  end

  def create
    state = State.find( params[:state_id] )
    new_city = City.create( city_params )
    state.cities << new_city
    redirect_to state_path(state)
  end

  def edit
    @state = State.find( params[:state_id] )
    @city = City.find( params[:id] )   
    # show me an update form 
  end

  def update
    state = State.find( params[:state_id] )
    edited_city = City.find( params[:id] )
    edited_city.update( city_params )
    redirect_to state_path(state)
  end

  def destroy
    state = State.find( params[:state_id] )
    City.delete( params[:id] )   
    redirect_to state_path(state)
  end

  private

  def city_params
    params.require(:city).permit(:name, :population, :state_id)
  end

end
