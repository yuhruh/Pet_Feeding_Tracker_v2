class User < ApplicationRecord
  before_save { self.email = email.downcase, self.password = password_confirmation }
  has_many :pets, dependent: :destroy
  has_many :trackers, dependent: :destroy
  has_secure_password
  validates_associated :pets
  validates_associated :trackers
  validates :name, presence: true, 
                      uniqueness: { case_sensitive: false }, 
                      length: { minimum: 3, maximum: 25 }
  validates :email, presence: true, 
                    uniqueness: true, 
                    length: { maximum: 105 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }, allow_nil: true
  validates :password, presence: true,
                       length: { minimum: 5 }
  validates :password_confirmation, presence: { message: "Upper and lower case should be the same."}
  validates :time_zone, presence: true, 
                      inclusion: {
                        in: ActiveSupport::TimeZone.all.map(&:tzinfo).map(&:identifier) }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email # Email from Google
      user.name = auth.info.name   # Full name from Google
      user.image = auth.info.image # Profile image URL from Google
      # You might want to generate a random password if email is required for password-based login
      # user.password = SecureRandom.hex(10) unless user.persisted?
      user.save!
    end
  end
end
