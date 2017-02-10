class Cookbook < ApplicationRecord
	has_and_belongs_to_many :recipies
	belongs_to :user
end
