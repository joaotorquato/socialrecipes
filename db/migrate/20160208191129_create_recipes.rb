class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :servings
      t.integer :preparation_time
      t.string :difficulty
      t.text :ingredients
      t.text :steps

      t.timestamps null: false
    end
  end
end
