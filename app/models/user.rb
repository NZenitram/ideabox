class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, on: :create
  validates_confirmation_of :password
  enum role: [:default, :admin]
  has_many :ideas, dependent: :destroy
end
