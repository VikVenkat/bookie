class HookupsController < ApplicationController
  # GET /hookups
  # GET /hookups.xml
  def index
    @hookups = Hookup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hookups }
    end
  end

#method post
  def create
	
	# First, if the user is not signed in, kick them out
    if !user_signed_in?
		flash[:notice] = "You have to sign in first!"
		redirect_to new_user_registration_path
	
	
	else		
		# Then, if they already accepted this challenge, kick them out
		if Hookup.where(:challenge_id => params[:challenge_id]).where(:user_id => current_user.id).present? 
			flash[:notice] = "You already accepted!"
			redirect_to root_path


		# Only when the user is signed in and has not yet taken this challenge, make it
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
  end

  # DELETE /hookups/1
  # DELETE /hookups/1.xml
  def destroy
    @hookup = Hookup.find(params[:id])
    @hookup.destroy

    respond_to do |format|
      format.html { redirect_to(hookups_url) }
      format.xml  { head :ok }
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
