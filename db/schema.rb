# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160208193945) do

  create_table "cuisines", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines_recipes", id: false, force: :cascade do |t|
    t.integer "cuisine_id", null: false
    t.integer "recipe_id",  null: false
  end

  add_index "cuisines_recipes", ["cuisine_id", "recipe_id"], name: "index_cuisines_recipes_on_cuisine_id_and_recipe_id"
  add_index "cuisines_recipes", ["recipe_id", "cuisine_id"], name: "index_cuisines_recipes_on_recipe_id_and_cuisine_id"

  create_table "food_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_types_recipes", id: false, force: :cascade do |t|
    t.integer "food_type_id", null: false
    t.integer "recipe_id",    null: false
  end

  add_index "food_types_recipes", ["food_type_id", "recipe_id"], name: "index_food_types_recipes_on_food_type_id_and_recipe_id"
  add_index "food_types_recipes", ["recipe_id", "food_type_id"], name: "index_food_types_recipes_on_recipe_id_and_food_type_id"

  create_table "preferences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences_recipes", id: false, force: :cascade do |t|
    t.integer "preference_id", null: false
    t.integer "recipe_id",     null: false
  end

  add_index "preferences_recipes", ["preference_id", "recipe_id"], name: "index_preferences_recipes_on_preference_id_and_recipe_id"
  add_index "preferences_recipes", ["recipe_id", "preference_id"], name: "index_preferences_recipes_on_recipe_id_and_preference_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "servings"
    t.integer  "preparation_time"
    t.string   "difficulty"
    t.text     "ingredients"
    t.text     "steps"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
