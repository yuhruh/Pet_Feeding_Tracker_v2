class Tracker < ApplicationRecord
  belongs_to :pet
  before_save { self.brand = brand.downcase }
  before_save { self.description = description.downcase }
  attribute :date, :datetime, default: ->{ Time.now }
  validates :food_type, presence: true
  validates :brand, presence: true, length: {minimum: 1, maximum: 50}
  validates :description, presence: true, length: {minimum: 2, maximum: 100}
  validates :amount, numericality: true, comparison: { greater_than: 0, less_than_or_equal_to: 500 }
end
