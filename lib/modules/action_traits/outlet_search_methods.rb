module ActionTraits
	module OutletSearchMethods
		extend ActiveSupport::Concern

		MIN_RADIUS_TO_SEARCH = 10
		DEFAULT_LENGTH_UNIT = 'km'

		module ClassMethods
			def get_nearby_outlets(latitude, longitude)
				Outlet.live.near([latitude, longitude], MIN_RADIUS_TO_SEARCH, units: DEFAULT_LENGTH_UNIT.to_sym)
			end
		end
	end
end
