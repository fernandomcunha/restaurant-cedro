class Restaurant < ApplicationRecord
  has_many :meadows, dependent: :destroy

  validates :name, presence: true
end
