class AddIndexToPlaylistsSongs < ActiveRecord::Migration
  def change
  	add_index :playlists_songs, :song_id
  	add_index :playlists_songs, :playlist_id
  end
end
