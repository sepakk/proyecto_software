class PlantPlaguesController < ApplicationController
	def create
		@plant = Plant.find(params[:plant_id])
		@plague = @plant.plant_plagues.new(plague_params)
	    if @plague.save
	        redirect_to @plant, notice: 'Se ha añadido una plaga a la planta.'
	    else
	    	logger.info(@cycle.errors)
	        redirect_to @plant, notice: @cycle.errors.humanize
	    end
	end

	def destroy
		@plant = Plant.find(params[:plant_id])
		@plague = @plant.plant_plagues.find(params[:id])
		@plague.destroy
		redirect_to plant_path(@plant)
	end

	private
  		def plague_params
  			params.require(:plant_plague).permit(:desc, :name, :plant_id, :plague_id)
  		end
end
