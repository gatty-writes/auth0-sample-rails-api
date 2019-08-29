class GeocodeController < BaseController
	def geocode
		opts = { 
			limit: 5, 
			types: 'locality,poi,address,postcode',
			country: 'US,CA,IN',
			auto_complete: true 
		}
		res = Geocoder.new(:MAP_BOX, request.parameters.merge(opts)).matching_places
		if(res.is_a?(Hash) && res.has_key?('error'))
			render json: { error: res.fetch('error', '')}, status: :unprocessable_entity
		else
			render json: {places: res }, status: 200
		end
	end
end
