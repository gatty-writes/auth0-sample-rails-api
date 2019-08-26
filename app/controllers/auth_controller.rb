class AuthController < BaseController
    def request_token
        render json: AuthAuthorization.new('DH').request_access_token
    end
end