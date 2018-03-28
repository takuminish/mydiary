class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { minimum: 6, maximum: 64 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
end
