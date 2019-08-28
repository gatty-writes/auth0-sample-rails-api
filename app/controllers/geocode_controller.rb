class GeocodeController < BaseController
	def geocode
		opts = { 
			limit: 5, 
			types: 'country,locality,poi,address',
			auto_complete: true 
		}
		render json: Geocoder.new(:MAP_BOX, request.parameters.merge(opts)).matching_places
	end
end
