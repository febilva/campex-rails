class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]

  # GET /guardians
  # GET /guardians.json
  def index
    @guardians = Guardian.all
  end

  # GET /guardians/1
  # GET /guardians/1.json
  def show
  end

  # GET /guardians/new
  def new
    @guardian = Guardian.new
  end

  # GET /guardians/1/edit
  def edit
  end

  # POST /guardians
  # POST /guardians.json
  def create
    @guardian = Guardian.new(guardian_params)

    respond_to do |format|
      if @guardian.save
        format.html { redirect_to @guardian, notice: 'Guardian was successfully created.' }
        format.json { render :show, status: :created, location: @guardian }
      else
        format.html { render :new }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guardians/1
  # PATCH/PUT /guardians/1.json
  def update
    respond_to do |format|
      if @guardian.update(guardian_params)
        format.html { redirect_to @guardian, notice: 'Guardian was successfully updated.' }
        format.json { render :show, status: :ok, location: @guardian }
        format.js do
          @registration_form = current_user.registration_form
          @origin_step = RegistrationStep.find_by_name(params[:step_name])
          if @registration_form.current_step == @origin_step.position
            @registration_form.increment(:current_step)
            @registration_form.save
          end

          render :template => 'dashboard/proceed2_next'
        end

      else
        format.html { render :edit }
        format.json { render json: @guardian.errors, status: :unprocessable_entity }
        format.js do
          render :template => 'dashboard/proceed2_next'
        end
      end
    end
  end

  # DELETE /guardians/1
  # DELETE /guardians/1.json
  def destroy
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to guardians_url, notice: 'Guardian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guardian
      @guardian = Guardian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guardian_params
      params.require(:guardian).permit(:student_id, :name, :gender, :email, :mobile_no, :phone_no, :relationship, :qualification_id, :occupation_id, :annual_income, :address_line1, :address_line2, :country_id, :state_id, :district_id, :taluk, :post_office, :pincode, :same_address)
    end
end
