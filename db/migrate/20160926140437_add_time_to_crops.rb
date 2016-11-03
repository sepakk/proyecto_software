class AddTimeToCrops < ActiveRecord::Migration[5.0]
  def change
  	add_column :crop_cycles, :time, :date
  end
end
