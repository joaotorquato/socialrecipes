class CreateJoinTableFoodTypeRecipe < ActiveRecord::Migration
  def change
    create_join_table :food_types, :recipes do |t|
      t.index [:food_type_id, :recipe_id]
      t.index [:recipe_id, :food_type_id]
    end
  end
end
