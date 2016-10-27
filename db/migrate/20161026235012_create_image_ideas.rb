class CreateImageIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :image_ideas do |t|
      t.references :image, foreign_key: true
      t.references :idea, foreign_key: true
    end
  end
end
