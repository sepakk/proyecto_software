class CreateReminders < ActiveRecord::Migration[5.0]
  def change
    create_table :reminders do |t|
      t.text :desc
      t.datetime :time
      t.references :crop, foreign_key: true

      t.timestamps
    end
  end
end
