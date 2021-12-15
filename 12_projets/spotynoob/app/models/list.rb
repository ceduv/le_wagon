class List < ApplicationRecord
  # @name
  # @style

  has_one_attached :photo

  belongs_to :user
  has_many :marks, dependent: :destroy
  has_many :musics, through: :marks

  validates :name, presence: true, uniqueness: true
  validates :style, presence: true

  STYLE = %w[classic rock pop rap electro autres...]
end
