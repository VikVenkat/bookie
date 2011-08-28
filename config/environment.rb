# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Bookie::Application.initialize!

# required for FBGraph
#require "fbgraph"

#trying to get koala to work
#The first line enables Facebook callback to your server.  The following line adds koala gem into this application.
#config.action_controller.allow_forgery_protection = false
#config.gem "koala"

