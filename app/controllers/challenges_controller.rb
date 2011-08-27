class ChallengesController < ApplicationController
  # GET /challenges
  # GET /challenges.xml
  def index
    @challenges = Challenge.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @challenges }
    end
  end

  # GET /challenges/1
  # GET /challenges/1.xml
  def show
    @challenge = Challenge.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @challenge }
    end
  end

  # GET /challenges/new
  # GET /challenges/new.xml
  def new
    @challenge = Challenge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @challenge }
    end
  end

  # GET /challenges/1/edit
  def edit
    @challenge = Challenge.find(params[:id])
  end
  

  # POST /challenges
  # POST /challenges.xml
  def create
    @challenge = Challenge.new(params[:challenge])
	
	@challenge.challenge_date = Date.today
	@challenge.due_date = Date.today + 7
	@challenge.complete = false
	
	#for Devise
	if user_signed_in?
		@challenge.user_id = current_user.id
		@challenge.started_by = current_user.id

	end


    respond_to do |format|
      if @challenge.save
        format.html { redirect_to(challenges_path, :notice => 'Challenge was successfully created.') }
        format.xml  { render :xml => @challenge, :status => :created, :location => @challenge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  #complete a challenge
  #PUT challenges/:id/complete
  
  def complete
    @challenge = Challenge.find(params[:id])
	
	if user_signed_in?
		@challenge.complete = true
		@challenge.completed_by = current_user.id
		@challenge.save
		flash[:notice] = "Completed Challenge."
		redirect_to root_path
	else
		flash[:notice] = "You have to sign in first!"
		redirect_to new_user_registration_path
	end
		
  end
  
  
  # PUT /challenges/1
  # PUT /challenges/1.xml
  def update
    @challenge = Challenge.find(params[:id])
	
    respond_to do |format|
      if @challenge.update_attributes(params[:challenge])
        format.html { redirect_to(@challenge, :notice => 'Challenge was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @challenge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /challenges/1
  # DELETE /challenges/1.xml
  def destroy
    @challenge = Challenge.find(params[:id])
    @challenge.destroy

    respond_to do |format|
      format.html { redirect_to(challenges_url) }
      format.xml  { head :ok }
    end
  end
  
  #try the graph w Koala
  require 'koala'

  def getpic
    # first, initialize a Graph API with your token
	@graph = Koala::Facebook::GraphAPI.new
	#@graph = Koala::Facebook::GraphAPI.new(142270179193416|2.AQAMuSE2pBMrQeD9.3600.1313298000.0-121146|SRkRQBnNM22oOUmz-eCtuXLPtmw) # pre 1.2beta
	#@graph = Koala::Facebook::API.new(your_oauth_token) # 1.2beta and beyond
	
	# http://graph.facebook.com/:fbname/picture
	@graph.get_picture("vik.venkat")
  
  end
end
