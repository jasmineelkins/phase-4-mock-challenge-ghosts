class Ghost < ApplicationRecord
  has_many :hauntings, dependent: :destroy
  has_many :haunted_houses, through: :hauntings

  validates :name, presence: true
  validates :age_at_death, numericality: { in: 0..100 }
end
