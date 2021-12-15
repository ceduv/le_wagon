class Mark < ApplicationRecord
  belongs_to :list
  belongs_to :music

  validates :music_id, presence: true
end
