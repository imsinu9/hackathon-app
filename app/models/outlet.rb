class Outlet < ActiveRecord::Base

	attr_accessible :title, :active, :approved, :latitude, :longitude, :logo
	geocoded_by :geocoded_name

	belongs_to :category
	belongs_to :user
	belongs_to :vendor

	has_attached_file :logo,
	  :default_url => 'assets/default_logo.jpg',
	  :styles => lambda { |a|
	    styles = {
	      :tiny  => "75x75#"
	    }
	    styles
	}

	scope :active, where( active: true)
	scope :active, where( approved: true)

	def geocoded_name
		title
	end
end
