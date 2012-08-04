class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.text :lyrics
      t.boolean :active
      t.integer :position
      t.references :album

      t.timestamps
    end
    add_index :songs, :album_id
  end
end
