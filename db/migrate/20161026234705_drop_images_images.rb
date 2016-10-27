class DropImagesImages < ActiveRecord::Migration[5.0]
  def change
    drop_table :images_ideas
  end
end
