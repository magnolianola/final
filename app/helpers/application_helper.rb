module ApplicationHelper
	def display_date(deadline)
		"#{deadline.strftime('%b/%d/%Y - %H:%M')}"
	end

end
