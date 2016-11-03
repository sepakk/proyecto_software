class AddIsStartedToCrops < ActiveRecord::Migration[5.0]
  def change
  	add_column :crop_cycles, :is_started, :boolean, default: false
  end
end
