class AuthController < ApplicationController
    def request_token
        render json: AuthToken.perform
    end
end