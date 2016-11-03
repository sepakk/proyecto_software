class Plant < ApplicationRecord
	has_many :cycles
	has_many :crops
	has_many :plagues, through: :plant_plagues
	has_many :diseases, through: :plant_diseases
	has_many :plant_plagues
	has_many :plant_diseases
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	def self.search(search)
		if search
			t = self.arel_table
			s = "%#{search}%"
			self.where(t[:name].matches(s))
			#self.where("name like ?", "%#{search}%")
		else
			self.all
		end
	end
end
