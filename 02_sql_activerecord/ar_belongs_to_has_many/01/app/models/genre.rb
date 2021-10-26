class Genre < ActiveRecord::Base
  has_many :tracks
  has_many :albums, -> { distinct }, through: :tracks
  has_many :artists, -> { distinct }, through: :albums
  # See ttp://guides.rubyonrails.org/association_basics.html section 4.3.3.10
end
