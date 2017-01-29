class CreateIngredientsAndRecipies < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :image
      t.timestamps null: false
    end

    create_table :ingredients_recipies, id: false do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipy, index: true
    end
  end
end
