class DistrictsController < ApplicationController
  before_action :set_state, except: [:show, :edit, :update, :destroy]
  before_action :set_district, only: [:show, :edit, :update, :destroy]

  # GET states/1/districts
  def index
    @districts = @state.districts
    respond_to do |format|
      format.html
      format.json { render json: @districts }
    end
  end

  # GET states/1/districts/1
  def show
  end

  # GET states/1/districts/new
  def new
    @district = @state.districts.build
  end

  # GET states/1/districts/1/edit
  def edit
  end

  # POST states/1/districts
  def create
    @district = @state.districts.build(district_params)

    if @district.save
      redirect_to(@district, notice: 'District was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT states/1/districts/1
  def update
    if @district.update_attributes(district_params)
      redirect_to(@district, notice: 'District was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE states/1/districts/1
  def destroy
    @district.destroy

    redirect_to state_districts_url(@district.state)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:state_id])
    end

    def set_district
      @district = District.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def district_params
      params.require(:district).permit(:name, :code)
    end
end
