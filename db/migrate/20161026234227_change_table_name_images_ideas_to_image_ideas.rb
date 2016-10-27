class ChangeTableNameImagesIdeasToImageIdeas < ActiveRecord::Migration[5.0]
  def change
    drop_table :image_ideas
  end
end
