class Category < ActiveRecord::Base
  has_and_belongs_to_many :recipies

  validates :name, :image, presence: true

  def self.search(search)
    where('lower(name) LIKE ?', "%#{search.downcase}%")
  end
end
