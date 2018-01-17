class Meadow < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, :name, :price, presence: true
end
