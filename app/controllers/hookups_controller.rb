class HookupsController < ApplicationController

#method post
  def create
  
    unless user_signed_in?
		flash[:notice] = "You have to sign in first!"
		redirect_to new_user_registration_path
		
	else
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

 #method put
 # def update
    # unless user_signed_in?
	#	flash[:notice] = "You have to sign in first!"
	#	redirect_to new_user_registration_path
    
	#else
		
	
    #end
 # end
 
  def comment
	  Hookup.where(:user_id => params[:user_id], :challenge_id => params[:challenge_id]).update_attribute(:u,:c)
  end
end
