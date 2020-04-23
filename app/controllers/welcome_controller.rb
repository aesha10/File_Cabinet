class WelcomeController < ApplicationController
	before_action :user_signed_in?
  def index
  	if user_signed_in?
      		redirect_to docs_path
	end
  end
end
