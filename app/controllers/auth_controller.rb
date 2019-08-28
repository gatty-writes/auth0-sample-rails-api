# frozen_string_literal: true

class AuthController < BaseController
  def request_token
    render json: AuthAuthorization.new('AUTH0').request_access_token
  end

  def authorize
    render json: AuthAuthorization.new('AUTH0').authorize
  end
end
