  #segunda entrega
class CreateCrops < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
