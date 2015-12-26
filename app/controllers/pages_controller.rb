class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dashboard]
  def home
  	if current_user
  		redirect_to kitchens_path
	end
	@kitchens = Kitchen.last(4)
  end

	def dashboard
		@kitchens = current_user.kitchens
	end
end
