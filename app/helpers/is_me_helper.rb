module IsMeHelper
	def is_me? user
		user_signed_in? && current_user == user
	end
end
