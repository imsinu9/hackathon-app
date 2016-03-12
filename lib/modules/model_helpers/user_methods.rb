module ModelHelpers
	module UserMethods

		def picture_from_url(url)
	    self.photo = open(url, allow_redirections: :all) rescue nil
	  end
	end
end
