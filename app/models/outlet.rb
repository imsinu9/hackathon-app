class Outlet < ActiveRecord::Base
	include ActionTraits::OutletSearchMethods

	acts_as_taggable

	attr_accessible :title, :active, :approved, :latitude, :longitude, :logo, :tag_list
	geocoded_by :geocoded_name

	belongs_to :category
	belongs_to :user
	belongs_to :vendor
	has_many :business_hours

	has_attached_file :logo,
	  :default_url => 'assets/default_logo.jpg',
	  :styles => lambda { |a|
	    styles = {
	      :tiny  => "75x75#"
	    }
	    styles
	}

	scope :live, where( active: true)
	scope :approved, where( approved: true)

	def geocoded_name
		title
	end

	class << self
		def get_outlets_based_on_location(latitude, longitude)
			Outlet.get_nearby_outlets(latitude, longitude)
		end
	end
end
