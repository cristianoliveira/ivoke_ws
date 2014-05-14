    require 'net/http'
    require 'json'

module GcmHelper
	
    private
      def get_google_uri
      	  URI.parse('https://android.googleapis.com/gcm/send')
      end
    private 
      def get_header

      	  {'Content-Type'  => 'application/json',
		   'Authorization' => 'key=AIzaSyD3OrVbZtn4iMFgffTelvmlk_13zDeSnt8'}
      	
      end

	def gcm_send_message(p_reg_id_to, p_message)
		
		url     = get_google_uri
		header  = get_header

		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		
		request = Net::HTTP::Post.new(url, 
			                          header)
		
		p "json "+{
  				"registration_ids" => [p_reg_id_to],
				"data" => {
				    "msg" => "Hello"
				  }
		}.to_json

		request.body = {
  				"registration_ids" => [p_reg_id_to],
				"data" => {
				    "msg" => p_message
				  }
		}.to_json

	    response = http.request(request)

	    p response.to_s
	    p "RESP CODE "+response.code
		p "RESP BoDY "+response.body

		return response
	end
end
