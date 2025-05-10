class User < ApplicationRecord
  before_save { self.email = email.downcase, self.password = password_confirmation }
  has_many :pets, dependent: :destroy
  # has_many :pet_trackers, dependent: :destroy
  has_secure_password
  validates_associated :pets
  validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    uniqueness: { case_sensitive: false }, 
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true,
                       length: { minimum: 8 },
                       format: { with: /(?=.*[0-9])(?=.*?[^A-Za-z0-9])(?=.*[a-z])(?=.*[A-Z])/, 
                       message: " should contain at least one upper case, one lower case, one digit and one special character" }
  validates :password_confirmation, presence: true
  validates :time_zone, presence: true, 
                      inclusion: {
                        in: ActiveSupport::TimeZone.all.map(&:tzinfo).map(&:identifier) }
end
