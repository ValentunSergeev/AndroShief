class CreateRecipesAndCookbooks < ActiveRecord::Migration
  def change
  	create_table :cookbooks do |t|
     t.belongs_to :user, index: true
     t.timestamps null: false
   end

   create_table :cookbooks_recipies, id: false do |t|
     t.belongs_to :cookbook, index: true
     t.belongs_to :recipy, index: true
   end
 end
end
