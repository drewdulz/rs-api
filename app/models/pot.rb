class Pot < ApplicationRecord
  # model association
  belongs_to :shelf

  # validation
  validates_presence_of :name
end
