class Recipy < ActiveRecord::Base
	has_and_belongs_to_many :cookbooks
	has_and_belongs_to_many :ingredients
	belongs_to :user
	has_many :steps
	accepts_nested_attributes_for :steps
end
