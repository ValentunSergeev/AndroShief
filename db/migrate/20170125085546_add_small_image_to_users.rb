class AddSmallImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :small_image, :text
  end
end
