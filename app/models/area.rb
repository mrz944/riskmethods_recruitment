class Area < ApplicationRecord
  #
  # => ASSOCIATIONS
  #

  has_many :locations

  #
  # VALIDATIONS
  #

  validates :geom, presence: true
end
