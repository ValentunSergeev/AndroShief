module Overrides
	class RegistrationsController < DeviseTokenAuth::RegistrationsController

		def create
			super do |resource|
				cookbook = Cookbook.new
				cookbook.user = resource
				cookbook.save
				resource.cookbook = cookbook
				resource.save
			end
		end

	end
end