class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many :recipies

  def self.search(search)
      where(['name LIKE ?', "%#{search}%"])
  end
end
