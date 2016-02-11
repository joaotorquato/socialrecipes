# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Cuisine.create([{name: 'Italiana'}, {name: 'Portuguesa'}, {name: 'Francesa'}])
# Preference.create([{name: 'Light'}, {name: 'Vegan'}, {name: 'Diet'}])
# FoodType.create([{name: 'Almoço'}, {name: 'Jantar'}, {name: 'Café da manhã'}])

FactoryGirl.create_list(:recipe, 6)
