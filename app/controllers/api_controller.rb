class ApiController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:all_products]
	respond_to :json

  protected

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
	end
end
