module Overrides
	class SessionsController < DeviseTokenAuth::SessionsController

		def render_create_success
			render json: {
				status: 'success',
				data:   @resource.token_validation_response,
				cookbook: @resource.cookbook.recipies.as_json
			}
		end

	end
end