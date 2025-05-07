class Pet < ApplicationRecord
  belongs_to :user
  validates :weight, numericality: true, comparison: { greater_than: 0 }
end
