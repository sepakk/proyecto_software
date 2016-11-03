class CreateCycles < ActiveRecord::Migration[5.0]
  def change
    create_table :cycles do |t|
      t.references :plant, foreign_key: true
      t.text :desc
      t.integer :time
      t.integer :position

      t.timestamps
    end
  end
end
