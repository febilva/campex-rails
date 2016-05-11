class StatesController < ApplicationController
  before_action :set_country, except: [:show, :edit, :update, :destroy]
  before_action :set_state, only: [:show, :edit, :update, :destroy]

  # GET countries/1/states
  def index
    @states = @country.states
    respond_to do |format|
      format.html
      format.json { render json: @states }
    end
  end

  # GET countries/1/states/1
  def show
  end

  # GET countries/1/states/new
  def new
    @state = @country.states.build
  end

  # GET countries/1/states/1/edit
  def edit
  end

  # POST countries/1/states
  def create
    @state = @country.states.build(state_params)

    if @state.save
      redirect_to(@state, notice: 'State was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT countries/1/states/1
  def update
    if @state.update_attributes(state_params)
      redirect_to(@state, notice: 'State was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE countries/1/states/1
  def destroy
    @state.destroy

    redirect_to country_states_url(@state.country)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_country
      @country = Country.find(params[:country_id])
    end

    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.require(:state).permit(:name, :code)
    end
end
