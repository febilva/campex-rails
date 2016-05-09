class ReservationCategoriesController < ApplicationController
  before_action :set_reservation_category, only: [:show, :edit, :update, :destroy]

  # GET /reservation_categories
  # GET /reservation_categories.json
  def index
    @reservation_categories = ReservationCategory.all
  end

  # GET /reservation_categories/1
  # GET /reservation_categories/1.json
  def show
  end

  # GET /reservation_categories/new
  def new
    @reservation_category = ReservationCategory.new
  end

  # GET /reservation_categories/1/edit
  def edit
  end

  # POST /reservation_categories
  # POST /reservation_categories.json
  def create
    @reservation_category = ReservationCategory.new(reservation_category_params)

    respond_to do |format|
      if @reservation_category.save
        format.html { redirect_to @reservation_category, notice: 'Reservation category was successfully created.' }
        format.json { render :show, status: :created, location: @reservation_category }
      else
        format.html { render :new }
        format.json { render json: @reservation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservation_categories/1
  # PATCH/PUT /reservation_categories/1.json
  def update
    respond_to do |format|
      if @reservation_category.update(reservation_category_params)
        format.html { redirect_to @reservation_category, notice: 'Reservation category was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation_category }
      else
        format.html { render :edit }
        format.json { render json: @reservation_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservation_categories/1
  # DELETE /reservation_categories/1.json
  def destroy
    @reservation_category.destroy
    respond_to do |format|
      format.html { redirect_to reservation_categories_url, notice: 'Reservation category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation_category
      @reservation_category = ReservationCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_category_params
      params.require(:reservation_category).permit(:name)
    end
end
