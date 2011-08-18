class HookupsController < ApplicationController

  def create
	@hookup = current_user.hookups.build(:challenge_id => params[:challenge_id])
	
	if @hookup.save
		flash[:notice] = "Added Challenge."
		redirect_to root_path
	else
		flash[:notice] = "Unable to add Challenge."
		redirect_to root_path
	end
  end

end
