class Pet < ApplicationRecord
  SPECIES = ['dog', 'cat', 'snake', 'rabbit', 'bird']

  validates :name, :address, :species, presence: true
  validates :species, inclusion: { in: SPECIES }
end
