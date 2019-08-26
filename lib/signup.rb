class Signup < AuthRequester
	def initialize(app)
		super
	end

	def perform(params)
		body = {
			client_id: Rails.application.credentials[Rails.env.to_sym][:auth0][:react_client_id],
			email: params[:email],
			password: params[:password],
			username: params[:username],
			connection: params[:connection]
		}.to_json

		post('/dbconnections/signup', body).parsed_response
	end
end