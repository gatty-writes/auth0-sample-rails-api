class SignupController < BaseController
	def signup
		render json: Signup.new(:AUTH0).perform(signup_params)
	end


	private
	def signup_params
		params.require(:signup).permit(:username, :email, :password, :connection, user_metadata: {})
	end
end