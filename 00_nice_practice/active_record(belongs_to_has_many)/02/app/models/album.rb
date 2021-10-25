class Album < ActiveRecord::Base
  self.table_name = "THE_ALBUMS"

  belongs_to :artist, foreign_key: 'id_artist'
  has_many :tracks

  validates_presence_of :artist, :title
end
