class StaticController < ApplicationController
	def home
		render json: { status: "Operating normally" }
	end
end