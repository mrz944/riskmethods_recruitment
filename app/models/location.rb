class Location < ApplicationRecord
  #
  # => ASSOCIATIONS
  #

  belongs_to :area, optional: true

  #
  # VALIDATIONS
  #

  validates :geom, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  #
  # => CALLBACKS
  #
  after_save :set_area

  def set_area
    LocalizerWorker.perform_async(id)
  end
end
