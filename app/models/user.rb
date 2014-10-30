class User < ActiveRecord::Base
  has_secure_password

  validates :email,                uniqueness: true
  validates :password,             presence:   true
  validates :password_confirmatin, presence:   true
end
