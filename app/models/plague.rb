class Plague < ApplicationRecord
	has_many :plants, through: :plant_plagues
	has_many :plant_plagues
end
