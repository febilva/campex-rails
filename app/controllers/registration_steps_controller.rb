class RegistrationStepsController < ApplicationController
  before_action :set_registration_step, only: [:show, :edit, :update, :destroy]

  # GET /registration_steps
  # GET /registration_steps.json
  def index
    @registration_steps = RegistrationStep.all
  end

  # GET /registration_steps/1
  # GET /registration_steps/1.json
  def show
  end

  # GET /registration_steps/new
  def new
    @registration_step = RegistrationStep.new
  end

  # GET /registration_steps/1/edit
  def edit
  end

  # POST /registration_steps
  # POST /registration_steps.json
  def create
    @registration_step = RegistrationStep.new(registration_step_params)

    respond_to do |format|
      if @registration_step.save
        format.html { redirect_to @registration_step, notice: 'Registration step was successfully created.' }
        format.json { render :show, status: :created, location: @registration_step }
      else
        format.html { render :new }
        format.json { render json: @registration_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registration_steps/1
  # PATCH/PUT /registration_steps/1.json
  def update
    respond_to do |format|
      if @registration_step.update(registration_step_params)
        format.html { redirect_to @registration_step, notice: 'Registration step was successfully updated.' }
        format.json { render :show, status: :ok, location: @registration_step }
      else
        format.html { render :edit }
        format.json { render json: @registration_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registration_steps/1
  # DELETE /registration_steps/1.json
  def destroy
    @registration_step.destroy
    respond_to do |format|
      format.html { redirect_to registration_steps_url, notice: 'Registration step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration_step
      @registration_step = RegistrationStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_step_params
      params.require(:registration_step).permit(:position, :name, :icon, :url)
    end
end
