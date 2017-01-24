class AddLikesToRecipies < ActiveRecord::Migration
  def change
    add_column :recipies, :likes_count, :integer, default: 0
  end
end
