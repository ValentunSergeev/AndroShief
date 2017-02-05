class Recipy < ActiveRecord::Base
	has_and_belongs_to_many :cookbooks
	has_and_belongs_to_many :ingredients
	has_and_belongs_to_many :categories
	belongs_to :user
	has_many :steps, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy

	validates :name, :description, :main_photo, presence: true
	validates :name, uniqueness: true
	validates :cook_time, :calories, :proteins, :fats, :carbohydrates, numericality: { greater_than: 0 }
	validates_associated :steps

	accepts_nested_attributes_for :steps

	def self.search(search)
			where('lower(name) LIKE ?', "%#{search.downcase}%")
	end
end
