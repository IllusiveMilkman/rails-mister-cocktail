class ReviewsController < ApplicationController
  def new
    raise
    # @cocktail = Cocktail.find(params[:cocktail_id])
    # @review = Review.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])

    @review = Review.new(review_params)
    @review.cocktail_id = params[:cocktail_id]

    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      # Add the rest of the  instance variables as found under
      # cocktails#show, as on fail it would have to render the
      # cocktails#show view from scratch
      @doses = Dose.where(cocktail_id: @cocktail.id)
      @dose = Dose.new
      @reviews = Review.where(cocktail_id: @cocktail.id)

      render 'cocktails/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :cocktail_id)
  end
end
