require 'rails_helper'

feature 'User sees recipe page' do
  scenario 'successfuly' do
    preferences = create_list(:preference, 3)
    food_types = create_list(:food_type, 3)
    cuisines = create_list(:cuisine, 3)

    recipe = create(:recipe)

    visit recipe_path recipe

    preferences.each do |preference|
      within('div#left-box') do
        expect(page).to have_link preference.name
      end
    end

    food_types.each do |food_type|
      within('div#left-box') do
        expect(page).to have_link food_type.name
      end
    end

    cuisines.each do |cuisine|
      within('div#left-box') do
        expect(page).to have_link cuisine.name
      end
    end

    within('div#middle-box') do
      expect(page).to have_content recipe.name
      # expect(page).to have_link recipe.username
      expect(page).to have_content recipe.preferences.first.name
      expect(page).to have_content recipe.food_types.first.name
      expect(page).to have_content recipe.cuisines.first.name
      expect(page).to have_content recipe.servings
      expect(page).to have_content recipe.difficulty
      expect(page).to have_content recipe.preparation_time
      expect(page).to have_content recipe.ingredients
    end

    within('div#right-box') do
      expect(page).to have_css("img[src*='#{recipe.photo.url}']")
      expect(page).to have_content recipe.steps
    end
  end
end
