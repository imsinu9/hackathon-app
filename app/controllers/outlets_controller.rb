class OutletsController < ApplicationController
	before_filter :get_outlets, only: [:index]
	before_filter :get_outlet, only: [:show]

	respond_to :json

	def index
	end

	def show
		@outlet_details = true
	end

	private
	
	def get_outlets
		latitude = params[:latitude]
		longitude = params[:longitude]

		@outlets = Outlet::get_outlets_based_on_location(latitude, longitude)
	end

	def get_outlet
		
		@outlet = Outlet.find_by_id(params[:id])
	end
end
