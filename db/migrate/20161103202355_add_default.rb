class AddDefault < ActiveRecord::Migration[5.0]
  def change
  	def up
	  change_column_default :users, :isadmin, false
	end

	def down
	  change_column_default :users, :isadmin, nil
	end
  end
end
