class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.references :user
      t.integer :position

      t.timestamps
    end
    add_index :playlists, :user_id
  end
end
