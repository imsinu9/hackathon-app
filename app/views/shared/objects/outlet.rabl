attributes :id, :title, :latitude, :longitude, :approved

if @outlet_details
	attributes :created_at, :user_id, :vendor_id
	node(:logo){ |outlet| outlet.logo.url }

	child :category, :root => "category", object_root: false do
		extends 'shared/objects/category'
	end

	child :tags, :root => "tags", object_root: false do
		extends 'shared/objects/tag'
	end

	child :business_hours, :root => "timings", object_root: false do
		extends 'shared/objects/business_hour'
	end
end
