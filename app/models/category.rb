class Category < ApplicationRecord
  has_and_belongs_to_many :recipies

  validates :name, :image, :color, :description, presence: true

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end
end
