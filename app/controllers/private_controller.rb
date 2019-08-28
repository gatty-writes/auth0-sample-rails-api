class PrivateController < BaseController
 	# Actions need to be secured must be added to the MUST_BE_SECURED constant array

 	MUST_BE_SECURED = [:hello]	
  include Secured
  
  def hello
    render json: { message: 'Hello from a private endpoint! You need to be authenticated to see this. You are authenticated.' }
  end

  def open_hello
  	render json: { message: 'This is from the private controller. But still accessible without the concerns'}
  end
end
