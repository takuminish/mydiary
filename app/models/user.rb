class User < ApplicationRecord
  has_secure_password
  has_many :diaries, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 6, maximum: 64 }
  validates :password, presence: true, length: { minimum: 6, maximum: 255 }
end
