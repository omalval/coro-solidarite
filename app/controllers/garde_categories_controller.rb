class GardeCategoriesController < ApplicationController
  before_action :set_garde, only: [:new, :create]
  def new
    @garde_category = GardeCategory.new
  end

  def create
  end

  private

  def garde_category_params
    params.require(:garde_category).permit(:garde_id)
  end

  def set_garde
    @garde = Garde.find(params[:garde_id])
  end
end
