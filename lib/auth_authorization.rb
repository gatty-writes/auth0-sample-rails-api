require_relative 'auth_requester'
class AuthAuthorization < AuthRequester
	def initialize(app)
		super
	end

	def request_access_token
		body = {
            client_id: Rails.application.credentials[Rails.env.to_sym][:auth0][:client_id],
            client_secret: Rails.application.credentials[Rails.env.to_sym][:auth0][:client_secret],
            audience: Rails.application.credentials[Rails.env.to_sym][:auth0][:api_audience],
            grant_type: Rails.application.credentials[Rails.env.to_sym][:auth0][:grant_type]
        }.to_json
		post('/oauth/token', body)
	end
end