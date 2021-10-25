class Artist < ActiveRecord::Base
  self.table_name = "ARTIST"
  self.primary_key = "artist_code"

  has_many :albums, foreign_key: 'id_artist'
  has_many :tracks, through: :albums

  validates_presence_of :name
end
