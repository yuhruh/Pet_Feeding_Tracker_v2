class Pet < ApplicationRecord
  belongs_to :user
  has_many :trackers, dependent: :destroy
  validates :name, presence: true, 
                      uniqueness: true, 
                      length: { minimum: 2, maximum: 25 }
  validates :weight, numericality: {message: "The weight should be greather than 0 and less than 100"}, 
        comparison: { less_than_or_equal_to: 100, greater_than: 0
  }
end
