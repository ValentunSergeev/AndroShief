class AddMainPhotoColumnToRecipies < ActiveRecord::Migration
  def change
    add_column :recipies, :main_photo, :text
  end
end
