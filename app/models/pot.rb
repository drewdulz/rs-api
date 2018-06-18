class Pot < ApplicationRecord
  # model association
  belongs_to :shelf
  has_many :plants

  # validation
  validates_presence_of :name
end
