class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ErrorsHandler::Handler
  include ActionController::MimeResponds
  include ActionController::Serialization
  include Pundit::Authorization

  protect_from_forgery with: :null_session

  prepend_before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name username])
    devise_parameter_sanitizer.permit(:sing_up, keys: %i[password email name username])
  end

  def pagination(object)
    {
      current_page: object.current_page,
      per_page: object.per_page(params),
      total_pages: object.total_pages,
      total_count: object.total_count
    }
  end
end
