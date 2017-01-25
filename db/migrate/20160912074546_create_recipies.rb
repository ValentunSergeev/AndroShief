class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.string :name
      t.text :description
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
