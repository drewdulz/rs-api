class Plant < ApplicationRecord
  # model association
  belongs_to :pot
  has_many :sensors
end
