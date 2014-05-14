class User < ActiveRecord::Base
	has_many :conversations
	has_many :google_devices
end
