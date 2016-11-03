class PlantDisease < ApplicationRecord
  belongs_to :plant
  belongs_to :disease
end
