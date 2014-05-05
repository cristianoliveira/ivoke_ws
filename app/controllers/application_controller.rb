class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Exception do |exception|
        error = {
        	     exception: exception.to_s,
        	     cause:     exception.cause()
        	    }
        
        render :json => error
    end

end
