class StatesController < ApplicationController

  def index
    @states = State.all
  end

  def new
    # show me a create form!!
  end

  def create
    new_state = State.create( state_params )
    redirect_to "/states/#{new_state.id}"
  end

  def edit
    @state = State.find( params[:id] )
    # show me an update form!!
  end

  def update
    edited_state = State.find( params[:id] )
    edited_state.update( state_params )
    redirect_to "/states/#{edited_state.id}"
  end

  def show
    @state = State.find( params[:id] )
    # show me the state page
  end

  def destroy
    State.delete( params[:id] )
    redirect_to "/states"
  end

  private

  def state_params
    params.require(:state).permit(:name, :abbreviation)
  end

end
