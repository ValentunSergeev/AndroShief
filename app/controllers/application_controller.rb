class ApplicationController < ActionController::Base
	include DeviseTokenAuth::Concerns::SetUserByToken
	protect_from_forgery with: :null_session
	before_action :configure_permitted_parameters, if: :devise_controller?
	devise_token_auth_group :member, contains: [:user, :admin]
  before_action :authenticate_member!, only: [:cookbook]

	def cookbook
		@recipies = current_user.cookbook.recipies.paginate(page: request.headers["Page"] || 1,
		                                                    per_page: request.headers["Per-Page"] || 10)
		render "recipies/index"
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

end
