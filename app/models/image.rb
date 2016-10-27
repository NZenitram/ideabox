class Image < ApplicationRecord
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  has_many :image_ideas, dependent: :destroy
  has_many :ideas, through: :image_ideas
end
