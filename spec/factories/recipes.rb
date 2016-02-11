FactoryGirl.define do
  factory :recipe do
    sequence(:name) { |n| "Receita #{n}" }
    sequence(:servings) { |n| n }
    sequence(:preparation_time) { |n| 30 * n }
    sequence(:difficulty) do |_n|
      Difficulty::TYPES.sample
    end
    sequence(:ingredients) { |n| "Ingredientes da receita #{n}" }
    sequence(:steps) { |n| "Passo-a-passo da receita #{n}" }
    cuisines { [create(:cuisine)] }
    preferences { [create(:preference)] }
    food_types { [create(:food_type)] }
    photo Rack::Test::UploadedFile.new(
      Rails.root.join('spec', 'images', 'campus_code.png'), 'image/jpg')
  end
end
