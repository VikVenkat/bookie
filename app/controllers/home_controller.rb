class HomeController < ApplicationController
  def index
	@challenge = Challenge.new

#	@graph = Koala::Facebook::GraphAPI.new(@facebook_cookies["access_token"])

#	@likes = @graph.get_connections("me", "likes")
#	@pic = @graph.get_picture("me")
  end

end
