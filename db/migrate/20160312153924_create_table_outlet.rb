class CreateTableOutlet < ActiveRecord::Migration
	def change
		create_table :outlets do |t|
			t.integer :category_id 
			t.integer :vendor_id 
			t.integer :user_id 
			t.string :title , null: :false, default: 'No Title'
			t.float :latitude 
			t.float :longitude 
			t.boolean :active, null: :false, default: false
			t.boolean :approved, null: :false, default: false

			t.attachment :logo

			t.timestamps
		end
	end
end
