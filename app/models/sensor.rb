class Sensor < ApplicationRecord
  # model association
  belongs_to :plant
  has_many :sensor_datum
end
