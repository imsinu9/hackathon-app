require 'open-uri'
require 'open_uri_redirections'

class User < ActiveRecord::Base
  include ModelHelpers::UserMethods

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :photo, :name,
                  :last_location_latitude, :last_location_longitude

  has_many :oauths, dependent: :destroy
  has_attached_file :photo,
    :default_url => 'assets/default_user.jpg',
    :styles => lambda { |a|
      styles = {
        :medium  => "290x290#",
        :tiny  => "75x75#"
      }
      styles
  }

  class << self
  	def omniauth_providers
  	  [:facebook]
  	end

  	def from_omniauth(auth, current_user = nil)
  	  authorization = Oauth.where(provider: auth['provider'], uid: auth['uid'].to_s).first_or_initialize
  	  if authorization.user.blank?
  	    user = current_user || User.where('email = ?', auth["info"]["email"]).first

  	    if user.blank?
  	      user = User.new
  	      user.name = auth['info']['name']
  	      user.email = auth['info']['email']
  	      user.password = Devise.friendly_token[0,10]
	        user.picture_from_url("http://graph.facebook.com/#{authorization.uid}/picture?type=large")
  	      user.save!
  	    end
  	    authorization.user_id = user.id
  	    authorization.oauth_token = auth[:credentials][:token]
  	    authorization.save
  	  end
  	  authorization.user
  	end
  end
end
