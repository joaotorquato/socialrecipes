class HomeController < ApplicationController
  def index
    @preferences = Preference.all
    @food_types = FoodType.all
    @cuisines = Cuisine.all
    @last_recipes = Recipe.last(3)
    @favorite_recipes = Recipe.first(3)
  end
end
