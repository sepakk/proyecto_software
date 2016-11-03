class Crop < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_many :reminders
  has_many :cycles, through: :crop_cycles
  has_many :crop_cycles

  def plant_name
  	if self.cycles.first
  		self.cycles.first.plant.name
  	else
  		"ascasfa"
  	end
  end

  def has_started?
    self.crop_cycles.first.is_started
  end

  def last_cycle
    self.crop_cycles.where(:is_started => true).last
  end
end
