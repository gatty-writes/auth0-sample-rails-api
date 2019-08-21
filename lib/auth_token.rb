require 'net/http'
require 'uri'
require 'json'

class AuthToken
    def self.perform
        uri = URI("#{Rails.application.credentials[Rails.env.to_sym][:auth0][:api_domian]}/oauth/token")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
        req.body = token_request_payload
        res = http.request(req).read_body
    end
    
    private
    def self.token_request_payload
        {
            client_id: Rails.application.credentials[Rails.env.to_sym][:auth0][:client_id],
            client_secret: Rails.application.credentials[Rails.env.to_sym][:auth0][:client_secret],
            audience: Rails.application.credentials[Rails.env.to_sym][:auth0][:api_audience],
            grant_type: Rails.application.credentials[Rails.env.to_sym][:auth0][:grant_type]
        }.to_json
    end
end
