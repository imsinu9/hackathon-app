class CreateTableTiming < ActiveRecord::Migration
	def change
		create_table :business_hours do |t|
			t.integer :outlet_id, null: false
			t.time :opens_at, null: false
			t.time :closed_at, null: false
			t.string :day_of_week, null: false
		end

		add_index :business_hours, [:outlet_id, :day_of_week]
	end
end
