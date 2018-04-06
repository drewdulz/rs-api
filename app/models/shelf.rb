class Shelf < ApplicationRecord
  # model association
  has_many :pots, dependent: :destroy

  # validations
  validates_presence_of :title
end
