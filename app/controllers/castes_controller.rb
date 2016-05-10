class CastesController < ApplicationController
  before_action :set_castes
  before_action :set_caste, only: [:show, :edit, :update, :destroy]

  # GET reservation_categories/1/castes
  def index
    @castes = @reservation_category.castes
    respond_to do |format|
      format.html
      format.json { render json: @castes }
    end
  end

  # GET reservation_categories/1/castes/1
  def show
  end

  # GET reservation_categories/1/castes/new
  def new
    @caste = @reservation_category.castes.build
  end

  # GET reservation_categories/1/castes/1/edit
  def edit
  end

  # POST reservation_categories/1/castes
  def create
    @caste = @reservation_category.castes.build(caste_params)

    if @caste.save
      redirect_to([@caste.reservation_category, @caste], notice: 'Caste was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT reservation_categories/1/castes/1
  def update
    if @caste.update_attributes(caste_params)
      redirect_to([@caste.reservation_category, @caste], notice: 'Caste was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE reservation_categories/1/castes/1
  def destroy
    @caste.destroy

    redirect_to reservation_category_castes_url(@reservation_category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castes
      @reservation_category = ReservationCategory.find(params[:reservation_category_id])
    end

    def set_caste
      @caste = @reservation_category.castes.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def caste_params
      params.require(:caste).permit(:name)
    end
end
