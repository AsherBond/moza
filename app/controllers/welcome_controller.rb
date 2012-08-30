class WelcomeController < ApplicationController
  def index
  	@featured_artists = User.where(featured: true).limit(4)
  	@popular_albums   = Album.includes(:user).limit(12).find_with_reputation(:album_votes, :all, order: "album_votes desc")
  	@popular_songs    = Song.includes(:album).limit(10).find_with_reputation(:song_votes, :all, order: "song_votes desc")
  	@new_albums       = Album.includes(:user).order("created_at desc").limit(8)

  	render :layout => "home"
  end
end
