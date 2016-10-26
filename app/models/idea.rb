class Idea < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true
  belongs_to :category
  belongs_to :user
end
