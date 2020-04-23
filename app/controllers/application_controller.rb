class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  		stored_location_for(resource) || docs_path
	end

	def after_sign_up_path_for(resource)
  		stored_location_for(resource) || docs_path
	end

	protected
	def authenticate_user!
    	if user_signed_in?
      		super
    	else
      		redirect_to root_path, :notice => 'Please Log In or Sign Up to continue'
    	end
  	end

end
