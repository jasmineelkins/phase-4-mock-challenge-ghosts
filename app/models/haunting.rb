class Haunting < ApplicationRecord
  belongs_to :ghost
  belongs_to :haunted_house
end
