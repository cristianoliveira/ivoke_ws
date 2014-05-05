module ApplicationHelper

	def exception_to_json(p_name, p_message, p_trace)
		{name=>p_name, message=>p_message, trace=>p_trace}.to_json
	end
end
