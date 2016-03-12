module ModelHelpers
	module UserMethods

		def picture_from_url(url)
	    self.photo = open(url, allow_redirections: :all) rescue nil
	  end

	  def update_user_location(latitude, longitude)
	  	self.update_attributes(last_location_latitude: latitude, last_location_longitude: longitude)
	  end
	end
end
