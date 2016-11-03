class CreatePlantPlagues < ActiveRecord::Migration[5.0]
  def change
    create_table :plant_plagues do |t|
      t.references :plant, foreign_key: true
      t.references :plague, foreign_key: true
      t.text :treatment

      t.timestamps
    end
  end
end
