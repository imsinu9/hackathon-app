class UsersController < ApplicationController
	
	def update_last_location
		latitude =  params[:latitude]
		longitude = params[:longitude]
		user_id = params[:user_id]

		user = User.find_by_id(user_id) if latitude && longitude

		user.update_user_location(latitude, longitude) if user
	end
end
