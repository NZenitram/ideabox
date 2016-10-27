class Idea < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :category
  belongs_to :user
  has_many :image_ideas, dependent: :destroy
  has_many :images, through: :image_ideas

end
