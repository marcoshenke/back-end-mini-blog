class ApplicationController < ActionController::Base
  include ErrorsHandler::Handler
  include ActionController::MimeResponds
  include ActionController::Serialization

  protect_from_forgery with: :null_session
end
