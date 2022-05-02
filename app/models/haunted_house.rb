class HauntedHouse < ApplicationRecord
  has_many :hauntings, dependent: :destroy
  has_many :ghosts, through: :hauntings

  #   make sure address starts with a number:
  validate :address_format

  def address_format
    unless address =~ /^[0-9].*/
      errors.add(:address, 'Address must begin with a number')
    end
  end
end
