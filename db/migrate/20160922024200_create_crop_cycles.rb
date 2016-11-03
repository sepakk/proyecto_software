class CreateCropCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :crop_cycles do |t|
      t.references :crop, foreign_key: true
      t.references :cycle, foreign_key: true

      t.timestamps
    end
  end
end
