class Music < ApplicationRecord
  has_many :marks, dependent: :destroy
  has_many :lists, through: :marks
  belongs_to :author

  validates :title, presence: true
  validates :author, presence: true
end
