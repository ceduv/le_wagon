class MediaType < ActiveRecord::Base
  self.table_name = "MEDIATYPES"

  has_many :tracks
end
