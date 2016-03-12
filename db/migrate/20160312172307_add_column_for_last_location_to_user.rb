class AddColumnForLastLocationToUser < ActiveRecord::Migration
  def change
  	add_column :users, :last_location_latitude, :float
  	add_column :users, :last_location_logitude, :float
  end
end
