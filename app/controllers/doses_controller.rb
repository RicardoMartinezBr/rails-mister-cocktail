class DosesController < ApplicationController
  # before_action :set_dose, only: [:show, :edit, :update, :destroy]

  # def index
  #   @doses = dose.find
  # end

  # def show
  # end

  def new
    @dose = Cocktail.find(params[:cocktail_id)
    @dose = Dose.new
  end

  # def edit
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  # def update
  #   if @dose.update(dose_params)
  #     redirect_to @dose, notice: 'Dose was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end


  # def destroy
  #   @dose.destroy
  #   redirect_to doses_path, notice: 'Dose was successfully destroyed.'
  # end

  # private

  #   def set_dose
  #       @dose = Dose.find(params[:id])
  #   end

  #   def dose_params
  #     params.require(:dose).permit(:description, :ingredient_id)
  #   end


end
