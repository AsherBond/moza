class ApplicationController < ActionController::Base
	protect_from_forgery

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to restricted_path, :alert => "Hey, what are you up too?"
	end

	def after_sign_in_path_for(resource)
		account_type_path
	end
end
