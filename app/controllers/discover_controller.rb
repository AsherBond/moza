class DiscoverController < ApplicationController
  def index
  	@albums = Album.text_search(params[:query]).page(params[:page]).per_page(3)
  end
  def browse
  	if params[:genre].present?
  		@genre = Genre.find(params[:genre])
  		@genres = GenresUsers.where(:genre_id => params[:genre])
  	else
  		@genres = GenresUsers.all
  	end
  end
end
