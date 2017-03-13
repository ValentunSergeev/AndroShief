class ApplicationController < ActionController::Base
	include DeviseTokenAuth::Concerns::SetUserByToken
	include ApplicationHelper
	protect_from_forgery with: :null_session
	before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:cookbook]
	respond_to :json

	def cookbook
		@recipies = current_user.cookbook.recipies.paginate(paginate_params)
		render "recipies/index"
	end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :small_image])
  end
end
