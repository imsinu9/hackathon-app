class BusinessHour < ActiveRecord::Base
	serialize :opens_at, Tod::TimeOfDay
	serialize :closed_at, Tod::TimeOfDay
	
	attr_accessible :opens_at, :closed_at, :day_of_week
	
	validates_presence_of :opens_at, :closed_at, :day_of_week, :outlet_id
	
	belongs_to :outlet
end
