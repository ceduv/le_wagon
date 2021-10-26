class Artist < ActiveRecord::Base
  has_many :albums
  has_many :tracks, through: :albums

  validates_presence_of :name
end
