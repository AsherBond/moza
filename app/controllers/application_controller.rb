class ApplicationController < ActionController::Base
	protect_from_forgery
	
	if Rails.env.production?
		http_basic_authenticate_with :name => "mozapolis", :password => "mozapolis88" 
	end

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to restricted_path, :alert => "You don't have permission to be here."
	end

	def after_sign_in_path_for(resource)
		if resource.has_role? :artist
			albums_path
		elsif resource.has_role? :fan
			playlists_path
		else
			root_path
		end
	end
end