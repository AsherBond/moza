class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :user
      t.string :name
      t.text :description
      t.boolean :active
      t.string :youtube_url

      t.timestamps
    end
    add_index :videos, :user_id
  end
end
