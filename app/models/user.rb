class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :password, confirmation: true, length: { minimum: 6 }
  # validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: true }

  before_save { |user| user.email.downcase! }
  before_save :create_sess_token

  private

    def create_sess_token
      self.sess_token = SecureRandom.urlsafe_base64
    end

end

