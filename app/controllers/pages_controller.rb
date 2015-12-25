class PagesController < ApplicationController
  def home
  	if current_user
  		redirect_to kitchens_path
	end
  end
end
