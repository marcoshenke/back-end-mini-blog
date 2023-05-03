module ErrorsHandler
  module Handler
    def self.included(clazz)
      clazz.class_eval do
        rescue_from ActiveRecord::RecordNotFound, with: :json_not_found_message
        rescue_from ActionController::ParameterMissing, with: :parameter_missing_error
        rescue_from ActiveRecord::RecordInvalid, with: :json_record_not_valid
        rescue_from ActiveRecord::NotNullViolation, with: :json_not_null_violation_error
        rescue_from ActiveRecord::RecordNotDestroyed, with: :json_record_not_destroyed
        rescue_from ActiveRecord::InvalidForeignKey, with: :json_invalid_foreign_key
        rescue_from CustomException, with: :json_custom_error
        rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
      end
    end

    protected

    def user_not_authorized
      render json: {
        error: {
          message: I18n.t('errors.messages.unauthenticated')
        }
      }
    end

    def json_not_found_message(exception)
      render json: {
        error: {
          message: (I18n.t(exception.model, scope: 'models').presence || '') + I18n.t('errors.messages.not_found')
        }
      }, status: :not_found
    end

    def json_custom_error(exception)
      render json: {
        error: {
          code: 422,
          message: exception.message
        }
      }, status: :unprocessable_entity
    end

    def parameter_missing_error
      render json: {
        error: {
          code: 422,
          message: 'Parâmetros inválidos. Verifique o(s) campo(s).'
        }
      }, status: :unprocessable_entity
    end

    def json_record_not_valid(exception)
      render json: {
        error: {
          message: "#{I18n.t('errors.messages.fail_on_save')} #{I18n.t(exception.record.model_name,
                                                                       scope: 'models').try(:strip).presence || ''}.",
          errors: exception.record.try(:errors).try(:full_messages).presence || ''
        }
      }, status: :unprocessable_entity
    end

    def json_not_null_violation_error(_exception)
      render json: {
        error: {
          message: 'Você tentou criar um registro mas não enviou todos os parâmetros necessários, por favor verifique a documentação e tente novamente.'
        }
      }, status: :unprocessable_entity
    end

    def json_record_not_destroyed(exception)
      render json: {
        error: {
          code: 422,
          message: exception.message
        }
      }, status: :unprocessable_entity
    end

    def json_invalid_foreign_key(_exception)
      render json: {
        error: {
          code: 422,
          message: I18n.t('errors.messages.invalid_foreign_key')
        }
      }, status: :unprocessable_entity
    end
  end
end
