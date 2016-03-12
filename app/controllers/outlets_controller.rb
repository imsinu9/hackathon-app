class OutletsController < ApplicationController
	before_filter :get_outlets

	def index
		respond_to do |format|
		  format.json
		end
	end

	private
	
	def get_outlets
		latitude = params[:latitude]
		longitude = params[:longitude]

		@outlets = Outlet::get_outlets_based_on_location(latitude, longitude)
	end
end
