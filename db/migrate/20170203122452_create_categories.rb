class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :image
      t.timestamps null: false
    end

    create_table :categories_recipies, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :recipy, index: true
    end
  end
end
