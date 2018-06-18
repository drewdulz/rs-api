class Shelf < ApplicationRecord
  # model association
  has_many :pots

  # validations
  validates_presence_of :name
end
