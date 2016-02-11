require 'rails_helper'

feature 'User sees recipes in root page' do
  scenario 'successfuly' do
    preferences = create_list(:preference, 3)
    food_types = create_list(:food_type, 3)
    cuisines = create_list(:cuisine, 3)

    recipes = create_list(:recipe, 3)

    visit root_path

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

    # Test the latest recipes section
    recipes.each do |recipe|
      within('div#middle-box') do
        # binding.pry
        expect(page).to have_css("img[src*='#{recipe.photo.url}']")
        expect(page).to have_link recipe.name
        expect(page).to have_content recipe.preferences.first.name
        expect(page).to have_content recipe.food_types.first.name
        expect(page).to have_content recipe.cuisines.first.name
        expect(page).to have_content recipe.difficulty
      end
    end

    # Test the favorite recipes section
    recipes.each do |recipe|
      within('div#right-box') do
        # binding.pry
        expect(page).to have_css("img[src*='#{recipe.photo.url}']")
        expect(page).to have_link recipe.name
        expect(page).to have_content recipe.preferences.first.name
        expect(page).to have_content recipe.food_types.first.name
        expect(page).to have_content recipe.cuisines.first.name
        expect(page).to have_content recipe.difficulty
      end
    end
  end
end
