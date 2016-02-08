class CreateJoinTablePreferenceRecipe < ActiveRecord::Migration
  def change
    create_join_table :preferences, :recipes do |t|
      t.index [:preference_id, :recipe_id]
      t.index [:recipe_id, :preference_id]
    end
  end
end
