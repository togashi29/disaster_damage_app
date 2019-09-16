class Damage < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :place, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :longitude, presence: true
  validates :description, presence: true

end
