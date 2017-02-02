class Recipy < ActiveRecord::Base
	has_and_belongs_to_many :cookbooks
	has_and_belongs_to_many :ingredients
	belongs_to :user
	has_many :steps, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
	accepts_nested_attributes_for :steps

	def self.search(search)
			where(['lower(name) LIKE ?', "%#{search.downcase}%"])
	end
end
