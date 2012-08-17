class PagesController < ApplicationController
  def home
  	@albums  = Album.limit(5).find_with_reputation(:album_votes, :all, order: 'album_votes desc')
  	@songs   = Song.limit(5).find_with_reputation(:song_votes, :all, order: 'song_votes desc')
  	@artists = User.limit(5)
  end
  def paypal
  end
end
