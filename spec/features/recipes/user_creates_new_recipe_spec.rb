require 'rails_helper'

feature 'User creates a new recipe' do
  scenario 'successfuly' do
    recipe = build(:recipe)

    visit new_recipe_path

    fill_in 'recipe[name]', with: recipe.name
    fill_in 'recipe[servings]', with: recipe.servings
    fill_in 'recipe[preparation_time]', with: recipe.preparation_time
    select recipe.difficulty
    fill_in 'recipe[ingredients]', with: recipe.ingredients
    fill_in 'recipe[steps]', with: recipe.steps
    select recipe.preferences.first.name
    select recipe.food_types.first.name
    select recipe.cuisines.first.name
    page.attach_file('recipe[photo]', 'spec/images/campus_code.png')

    click_on 'Criar Receita'

    expect(page).to have_content recipe.name
    expect(page).to have_content recipe.servings
    expect(page).to have_content recipe.preparation_time
    expect(page).to have_content recipe.difficulty
    expect(page).to have_content recipe.ingredients
    expect(page).to have_content recipe.steps
    expect(page).to have_content recipe.preferences.first.name
    expect(page).to have_content recipe.food_types.first.name
    expect(page).to have_content recipe.cuisines.first.name
    expect(page).to have_css("img[src*='campus_code.png']")
  end

  scenario 'invalid data' do
    visit new_recipe_path

    click_on 'Criar Receita'

    %w(name servings preparation_time difficulty
       ingredients steps).each do |field|
      within(".recipe_#{field}") do
        expect(page).to have_content "can\'t be blank"
      end
    end
  end
end
