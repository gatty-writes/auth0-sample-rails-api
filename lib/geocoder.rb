require 'cgi'
class Geocoder < AuthRequester
	def initialize(app, opts={})
		super
	end
	
	def matching_places
		# url = <<~HEREDOC
		# 	#{Rails.application.credentials[Rails.env.to_sym][:mapbox][:geocoding_sub_url]}
		# 	#{opts[:query]}.json?
		# 	&access_token= #{Rails.application.credentials[Rails.env.to_sym][:mapbox][:access_token]}
		# 	&limit=#{opts[:limit]}
		# 	&types=#{opts[:types]}
		# 	&autocomplete=#{opts[:auto_complete]}
		# HEREDOC

		#note all the query spaces must be escaped to %20. else HTTParty throws bad uri error

		url = "#{Rails.application.credentials[Rails.env.to_sym][:mapbox][:geocoding_sub_url]}#{opts[:query].gsub(" ", "%20")}.json?"
		url.concat("access_token=#{Rails.application.credentials[Rails.env.to_sym][:mapbox][:access_token]}")
		url.concat("&limit=#{opts[:limit]}&types=#{opts[:types]}&autocomplete=#{opts[:auto_complete]}")
	
		res = get(url).parsed_response
		format_matching_places res
	end

	private
	def format_matching_places res
		result_set = JSON.parse(res)['features'] || {}
		return {} if result_set.length == 0
		result_set.each_with_object([]) { |key, col| col.push({place_name: key['place_name']}) }
	end
end