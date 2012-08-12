class PlaylistsSongs < ActiveRecord::Base
  attr_accessible :playlist_id, :song_id
  has_many :playlists
  has_many :songs
end
