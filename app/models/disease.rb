class Disease < ApplicationRecord
	has_many :plant_diseases
	has_many :plants, through: :plant_diseases
end
