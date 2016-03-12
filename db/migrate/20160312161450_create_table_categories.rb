class CreateTableCategories < ActiveRecord::Migration
	def change
		create_table :categories do |t|
			t.string :name, null: false
			t.boolean :active, null: false, default: true
		end
	end
end
