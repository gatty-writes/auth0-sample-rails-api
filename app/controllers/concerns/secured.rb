module Secured
    extend ActiveSupport::Concern

    # hint: https://stackoverflow.com/questions/44800673/how-to-include-concerns-module-with-only-actions-in-rails-controllers
    # Actions specified in the MUST_BE_SECURED constant array will be passed to the authenticate_request!
  
    included do |base|
      actions = base.const_defined?('MUST_BE_SECURED') && base.const_get('MUST_BE_SECURED')
      before_action :authenticate_request!, only: actions
    end
  
    private
  
    def authenticate_request!
      auth_token
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
    end
  
    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end
  
    def auth_token
      JsonWebToken.verify(http_token)
    end
  end