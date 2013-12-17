module ApplicationHelper
	def display_date(deadline)
		"#{deadline.in_time_zone('Eastern Time (US & Canada)').strftime('%b/%d/%Y - %H:%M')}"
	end

end
