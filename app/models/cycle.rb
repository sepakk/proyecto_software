class Cycle < ApplicationRecord
  belongs_to :plant
  has_many :steps, inverse_of: :cycle, dependent: :destroy
  has_many :crops, through: :crop_cycles
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  accepts_nested_attributes_for :steps, allow_destroy: true
end
