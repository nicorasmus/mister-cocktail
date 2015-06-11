class DosesController < ApplicationController
  before_action :set_dose, only: [:show, :update, :destroy]
  before_action :find_cocktail, only: [:create]

  # GET /doses
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # PATCH/PUT /doses/1
  def update
    if @dose.update(dose_params)
      redirect_to @dose, notice: 'Dose was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /doses/1
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path, notice: 'Dose was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @dose = Dose.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
    end

    def find_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end
end
