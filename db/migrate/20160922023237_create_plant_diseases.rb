class CreatePlantDiseases < ActiveRecord::Migration[5.0]
  def change
    create_table :plant_diseases do |t|
      t.references :plant, foreign_key: true
      t.references :disease, foreign_key: true
      t.text :treatment

      t.timestamps
    end
  end
end
