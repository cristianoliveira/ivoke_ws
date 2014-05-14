  
class GcmController < ApplicationController
	
	include GcmHelper

	def send_message
		user         = User.find(params[:to_user_id])
		message      = params[:message]
		
		if(user.google_devices)
			user.google_devices do |d|
				response     = gcm_send_message( d.registration_id , message )
			end
		    render json: { "code" => response.code, "body"=> response.body}
		else
			render json: { "result" => "No devices found"}
		end
	end
end
