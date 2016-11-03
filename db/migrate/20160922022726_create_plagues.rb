class CreatePlagues < ActiveRecord::Migration[5.0]
  def change
    create_table :plagues do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
