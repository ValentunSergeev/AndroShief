class ApplicationController < ActionController::Base
	include DeviseTokenAuth::Concerns::SetUserByToken
	protect_from_forgery with: :null_session
	
	devise_token_auth_group :member, contains: [:user, :admin]
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :authenticate_member!, only: [:show_cookbook]


	def cookbook
		@recipies = current_user.cookbook.recipies
	end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  end

end
