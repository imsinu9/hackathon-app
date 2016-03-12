class OmniauthController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def facebook
	  auth_params = request.env["omniauth.params"]

		user = User.from_omniauth(env["omniauth.auth"], current_user)
	  if user.persisted?
	    flash[:notice] = "You are in..!!!"
	    sign_in_and_redirect(user)
	  else
	    session["devise.user_attributes"] = user.attributes
	    redirect_to root_path
	  end
	end

	def failure
	  redirect_to root_path
	end
end
