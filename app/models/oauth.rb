class Oauth < ActiveRecord::Base

	attr_accessible :uid, :provider, :oauth_token, :user_id

  validates_presence_of :uid, :provider, :oauth_token, :user_id
  validates_uniqueness_of :uid, :scope => [:provider]

  belongs_to :user
end
