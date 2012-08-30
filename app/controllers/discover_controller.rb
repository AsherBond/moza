class DiscoverController < ApplicationController
  def index
  	@albums = Album.text_search(params[:query]).page(params[:page]).per_page(3)
  end

  def browse
  	if genre?
  		@genre = Genre.find(genre)
  		@genres = GenresUsers.where(:genre_id => genre)
  	else
  		@genres = GenresUsers.all
  	end
  end

  private

    def query?
      params[:query].present?
    end

    def query
      params[:query]
    end

    def genre?
      params[:genre].present?
    end

    def genre
      params[:genre].to_i
    end
end
