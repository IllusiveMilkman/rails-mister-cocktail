class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose = Dose.new(dose_params)
    @dose.cocktail_id = params[:cocktail_id]

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      # Add the rest of the  instance variables as found under
      # cocktails#show, as on fail it would have to render the
      # cocktails#show view from scratch
      @doses = Dose.where(cocktail_id: @cocktail.id)
      @review = Review.new
      @reviews = Review.where(cocktail_id: @cocktail.id)

      render 'cocktails/show'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
