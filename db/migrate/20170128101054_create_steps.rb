class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.text :description
      t.text :image
      t.belongs_to :recipy, index: true
      t.timestamps null: false
    end
  end
end
