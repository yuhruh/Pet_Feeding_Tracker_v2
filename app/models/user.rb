class User < ApplicationRecord
  before_save { self.email = email.downcase, self.password = password_confirmation }
  has_many :pets, dependent: :destroy
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
                       length: { minimum: 8 }
  validates :password_confirmation, presence: { message: "Upper and lower case should be the same."}
  validates :time_zone, presence: true, 
                      inclusion: {
                        in: ActiveSupport::TimeZone.all.map(&:tzinfo).map(&:identifier) }
end
