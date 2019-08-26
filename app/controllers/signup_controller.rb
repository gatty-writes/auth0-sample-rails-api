class SignupController < BaseController
	def signup
		render json: Signup.new(:DH).perform(signup_params)
	end


	private
	def signup_params
		params.require(:signup).permit(:username, :email, :password, :connection)
	end
end