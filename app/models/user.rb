class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  validates_confirmation_of :password
  has_many :ideas
end
