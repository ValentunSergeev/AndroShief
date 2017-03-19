class AddColorToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :color, :string, default: "#398E3D"
  end
end
