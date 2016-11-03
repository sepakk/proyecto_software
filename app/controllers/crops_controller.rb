class CropsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		plant_id = params[:plant_id]
		@crop = Crop.create(user_id: current_user.id, plant_id: plant_id)
		@plant = Plant.find(plant_id)
		@plant.cycles.each do |cycle|
			@crop.crop_cycles.create(cycle_id: cycle.id)
		end
		redirect_to current_user
	end

	def show
		@crop = Crop.find(params[:id])
	end

	def index
		@crops = current_user.crops
	end
end
