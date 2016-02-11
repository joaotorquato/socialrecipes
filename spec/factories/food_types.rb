FactoryGirl.define do
  factory :food_type do
    sequence(:name) { |n| "Food Type #{n}" }
  end
end
