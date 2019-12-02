class Area < ApplicationRecord
  #
  # VALIDATIONS
  #

  validates :geom, presence: true

end
