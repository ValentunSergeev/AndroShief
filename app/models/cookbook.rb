class Cookbook < ActiveRecord::Base
	has_and_belongs_to_many :recipies
	belongs_to :user
end
