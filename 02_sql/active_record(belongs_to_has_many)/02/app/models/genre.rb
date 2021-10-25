class Genre < ActiveRecord::Base
  self.table_name = "genrez"

  has_many :tracks

  def artists
    tracks.map { |track| track.album.artist }.uniq
  end
end
