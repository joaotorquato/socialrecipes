class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def show
    @preferences = Preference.all
    @food_types = FoodType.all
    @cuisines = Cuisine.all
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :servings, :preparation_time,
                                   :difficulty, :ingredients, :steps,
                                   :photo, cuisine_ids: [], preference_ids: [],
                                           food_type_ids: [])
  end
end
