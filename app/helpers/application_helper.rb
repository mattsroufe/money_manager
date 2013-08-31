module ApplicationHelper
	def is_active?(path)
		if request.fullpath == path
			'class=active'
		end
	end
end
