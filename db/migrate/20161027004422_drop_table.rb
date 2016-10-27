class DropTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :images, :images_file_name, :image_file_name
    rename_column :images, :images_content_type, :image_content_type
    rename_column :images, :images_file_size, :image_file_size
    rename_column :images, :images_updated_at, :image_update_at
  end
end
