class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery unless: -> { request.format.json? }
  before_action :configure_permitted_parameters, if: :devise_controller?
	respond_to :json

  protected

  def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
	end
end
