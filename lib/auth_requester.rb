
class AuthRequester
    attr_accessor :base_url

  APP_BASE_URL_MAP = {
    DH: Rails.application.credentials[Rails.env.to_sym][:auth0][:api_domian]
  }

  def initialize(app)
    self.base_url = APP_BASE_URL_MAP[app.to_sym]
  end

  def get(rel_url)
    self.request(:get, rel_url)
  end

  def delete(rel_url)
    self.request(:delete, rel_url)
  end

  def put(rel_url, body)
    self.request(:put, rel_url, body)
  end

  def patch(rel_url, body)
    self.request(:patch, rel_url, body)
  end

  def post(rel_url, body)
    self.request(:post, rel_url, body)
  end

  def request(method, rel_url, body=nil, token=false)
    headers = { 'Content-Type': 'application/json' }
    headers[:Authorization] = "Bearer #{access_token}" if token

    HTTParty.send(method.to_sym, "#{self.base_url}#{rel_url}", {
        headers: headers,
        body: body
      })

  end
end

