class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: {minimum: 5}
  validates :password_confirmation, presence: true

  before_save { email.downcase! }

  def self.authenticate_with_credentials(email, password)
    # Strip leading and trailing white spaces from email
    email = email.lstrip.rstrip
    # Get user from db by email
    user = User.find_by_email(email.downcase)
    if user && user.authenticate(password)
      return user
    end
    return nil
  end
end
