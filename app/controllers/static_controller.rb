class StaticController < ApplicationController
	#sends a message to the user if they hit the route /status
	def home
		render json: { status: "Operating normally" }
	end
end