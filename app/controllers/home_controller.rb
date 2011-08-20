class HomeController < ApplicationController
  def index
	@challenge = Challenge.new
  end

end
