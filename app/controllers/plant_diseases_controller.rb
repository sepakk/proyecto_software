class PlantDiseasesController < ApplicationController
	def create
		@plant = Plant.find(params[:plant_id])
		@disease = @plant.plant_diseases.new(disease_params)
	    if @disease.save
	        redirect_to @plant, notice: 'Se ha añadido una plaga a la planta.'
	    else
	    	logger.info(@cycle.errors)
	        redirect_to @plant, notice: @cycle.errors.humanize
	    end
	end

	def destroy
		@plant = Plant.find(params[:plant_id])
		@disease = @plant.plant_diseases.find(params[:id])
		@disease.destroy
		redirect_to plant_path(@plant)
	end

	private
  		def disease_params
  			params.require(:plant_disease).permit(:desc, :name, :plant_id, :disease_id)
  		end
end
