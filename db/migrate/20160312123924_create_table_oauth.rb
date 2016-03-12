class CreateTableOauth < ActiveRecord::Migration
	def change	
		create_table "oauths", :force => true do |t|
		  t.integer  "user_id"
		  t.string   "provider"
		  t.string   "uid"
		  t.string   "oauth_token"
		  t.datetime "token_expires_at"

		  t.timestamps
		end
		add_index :oauths, [:provider, :uid]

	end
end
