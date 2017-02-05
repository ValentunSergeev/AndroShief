class UpdateRecipies < ActiveRecord::Migration
  def change
    add_column :recipies, :cook_time, :integer
    add_column :recipies, :calories, :integer
    add_column :recipies, :proteins, :integer
    add_column :recipies, :fats, :integer
    add_column :recipies, :carbohydrates, :integer
  end
end
