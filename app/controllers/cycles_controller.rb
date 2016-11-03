class CyclesController < ApplicationController
	before_action :set_plant, only: [:create, :edit, :update, :destroy]
	def create
		@cycle = @plant.cycles.new(cycle_params)
	    if @cycle.save
	        redirect_to @plant, notice: 'Se ha añadido un ciclo a la planta.'
	    else
	    	logger.info(@cycle.errors)
	        redirect_to @plant, notice: @cycle.errors.humanize
	    end
	end

	def edit
		@cycle = Cycle.find(params[:id])
	end

	def update
		@cycle = Cycle.find(params[:id])
		if @cycle.update(cycle_params)
			redirect_to @cycle.plant, notice: 'El ciclo fue actualizado.' 
		else
			render :edit
		end
	end

	def destroy
		@cycle = @plant.cycles.find(params[:id])
		@cycle.destroy
		redirect_to plant_path(@plant)
	end

	private

		def set_plant
	      @plant = Plant.find(params[:plant_id])
	    end
  		def cycle_params
  			params.require(:cycle).permit(:desc, :time, :position, :avatar, steps_attributes: [:id, :desc, :_destroy])
  		end
end
